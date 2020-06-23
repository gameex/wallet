<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\wallet\controller;

use cmf\controller\RestBaseController;
use think\Db;
use think\Validate;

class RpcFetchController extends RestBaseController
{

    public function index($coin_symbol){

        if($coin_symbol=='BTC'||$coin_symbol=='BCH'||$coin_symbol=='LTC'){
            $ret = $this->rpc_get_transactions($coin_symbol);
            if($ret['code']==0){
                die($ret['msg']);
            }
            dump($ret);
            $list = $ret['data']['transactions'];
            $pos = $ret['data']['lastblock'];
            //$pos = $ret['data']['transactions'];
            foreach ($list as $key => $value) {
                $amount = $value['amount'];
                if(isset($value['blockhash'])){
                   $blockhash = $value['blockhash']; 
               }else{
                   $blockhash =$value['txid'];
               }
                
                $txid = $value['txid'];
                $fee = 0;
                $memo = "";
                if($value['category']=='receive'){
                   $from= "";
                   $to= $value['address'];                    
                   $this->add_transfer_log($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);
                }else{
                   $from= "";
                   $to= $value['address'];             
                   $fee = $value['fee'];     
                   $this->confirm_transfer($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);
                }
                //var_dump($value);  
            }
            $this->update_rpc_last_pos($coin_symbol,$pos);      
        }


        if($coin_symbol=='USDT'){
            //地址列表
            $address_list = [];
            $address_data = Db::name('wallet')
            ->Distinct(true)
            ->field("address")
            ->where('coin_symbol', $coin_symbol)
            ->where('address', 'neq','')
            ->select()->toArray();
            foreach ($address_data as $key => $value) {
                $address_list[] = $value['address'];
            }            
            $ret = $this->rpc_get_transactions($coin_symbol);
            if($ret['code']==0){
                die($ret['msg']);
            }
            $list = $ret['data']['transactions'];
            $pos = $ret['data']['lastblock'];

            foreach ($list as $key => $value) {
                $from= $value['sendingaddress'];
                $to= $value['referenceaddress'];
                $amount = $value['amount'];
                $blockhash = $value['blockhash'];
                $txid = $value['txid'];
                $memo = "";
                $fee = $value['fee'];
                if(in_array($to,$address_list)){
                   $this->add_transfer_log($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);
                }
                if(in_array($from,$address_list)){
                   $this->confirm_transfer($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);
                }                
            }
            $this->update_rpc_last_pos($coin_symbol,$pos);      
        }

        if($coin_symbol=='ETH'){
            //地址列表
            $address_list = [];
            $address_data = Db::name('wallet')
            ->Distinct(true)
            ->field("address")
            ->where('coin_symbol', $coin_symbol)
            ->where('address', 'neq','')
            ->select()->toArray();
            foreach ($address_data as $key => $value) {
                $address_list[] = $value['address'];
            }
            $address_data = Db::name('wallet')
            ->Distinct(true)
            ->field("address")
            ->alias('a')
            ->join(config('database.prefix').'coin b',"a.coin_symbol = b.coin_symbol")
            ->where('parent_coin', 'ETH')
            ->where('address', 'neq','')
            ->select()->toArray();
            foreach ($address_data as $key => $value) {
                $address_list[] = $value['address'];
            }            
            //合约列表
            $contract_list = [];
            $contract_info=[];
            $contract_data = Db::name('coin')
            ->field("coin_symbol,contract,decimals")
            ->where('parent_coin', $coin_symbol)
            ->where('contract', 'neq','')
            ->select()->toArray();
            foreach ($contract_data as $key => $value) {
                $value['contract'] = strtolower($value['contract']);
                $contract_list[] = $value['contract'];
                $contract_info[$value['contract']]['coin_symbol'] =  $value['coin_symbol'];
                $contract_info[$value['contract']]['decimals'] =  $value['decimals'];
            }
            $ret = $this->rpc_get_transactions($coin_symbol);
            if($ret['code']==0){
                die($ret['msg']);
            }
            $list = $ret['data']['transactions'];
            $pos = $ret['data']['lastblock'];
            foreach ($list as $key => $value) {   
                $from = $value['from'];
                $to = $value['to'];     
                $amount  = gmp_init($value['value'],16);
                $amount  = round(gmp_strval($amount ,10)/pow(10,18),8) ;//转为十进制 
                $blockhash = $value['blockHash'];
                $gas_price =  gmp_init($value['gasPrice'],16);
                $gas_price  = gmp_strval($gas_price ,10)/pow(10,18);//转为十进制 
                $gas =  gmp_init($value['gas'],16);
                $gas  = gmp_strval($gas ,10);//转为十进制 
                $fee = $gas*$gas_price;
                $txid = $value['hash'];
                $memo = "";
                //判断发送方
                if (in_array($from,$address_list)){
                    if($amount == 0){ //是合约交易
                        if (in_array($to,$contract_list)){
                            $info_coin_symbol = $contract_info[$to]['coin_symbol'];
                            $info_decimals = $contract_info[$to]['decimals'];                            
                            //解析合约
                            $ret = $this->rpc_get_transaction_receipt($coin_symbol,$txid);
                            if($ret['code']==0){
                                die($ret['msg']);
                            }
                            if(isset($ret['data']['logs'][0])){
                                $info = $ret['data']['logs'][0];
                                $info_from = "0x".substr($info['topics'][1],26);
                                $info_to = "0x".substr($info['topics'][2],26);
                                $info_amount  = gmp_init($info['data'],16);
                                $info_amount  = round(gmp_strval($info_amount ,10)/pow(10,$info_decimals),8) ;//转为十进制  
                                $this->confirm_transfer($info_coin_symbol,$info_from,$info_to,$memo,$info_amount,$fee,$blockhash,$txid);
                            }
                        }
                    }else{
                        $this->confirm_transfer($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);
                    }   
                }
                //判断接收方
                if (in_array($to,$address_list)){
                   $this->add_transfer_log($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);
                }
                //判断合约地址          
                if (in_array($to,$contract_list)){
                  
                    $info_coin_symbol = $contract_info[$to]['coin_symbol'];
                    $info_decimals = $contract_info[$to]['decimals'];  
                  
                    $token_address_list = [];
                    $token_address_data = Db::name('wallet')
                    ->Distinct(true)
                    ->field("address")
                    ->where('coin_symbol', $info_coin_symbol )
                    ->where('address', 'neq','')
                    ->select()->toArray();
                    foreach ($token_address_data as $key => $value) {
                        $token_address_list[] = $value['address'];
                    }                  
                    //解析合约
                    $ret = $this->rpc_get_transaction_receipt($coin_symbol,$txid);
                    if($ret['code']==0){
                        die($ret['msg']);
                    }
                    //dump('1');
                     //dump($ret['data']['logs']);
                    if(isset($ret['data']['logs'][0])){
                        //dump('2');
                        $info = $ret['data']['logs'][0];
                        $info_from = "0x".substr($info['topics'][1],26);
                        $info_to = "0x".substr($info['topics'][2],26);
                        $info_amount  = gmp_init($info['data'],16);
                        $info_amount  = round(gmp_strval($info_amount ,10)/pow(10,$info_decimals),8) ;//转为十进制 
                        //dump($info_to);
                        if(in_array($info_to,$token_address_list)) {
                            //dump('3');dump($from);dump($to);dump($info_amount);dump($fee);
                            $this->add_transfer_log($info_coin_symbol,$info_from,$info_to,$memo,$info_amount,$fee,$blockhash,$txid);
                        }                             
                    }
               
                }
            }

            $this->update_rpc_last_pos($coin_symbol,$pos); 
        }
         if($coin_symbol=='ETC'){
            //地址列表
            $address_list = [];
            $address_data = Db::name('wallet')
            ->Distinct(true)
            ->field("address")
            ->where('coin_symbol', $coin_symbol)
            ->where('address', 'neq','')
            ->select()->toArray();
            foreach ($address_data as $key => $value) {
                $address_list[] = $value['address'];
            }
        
            $ret = $this->rpc_get_transactions($coin_symbol);
            if($ret['code']==0){
                die($ret['msg']);
            }
            $list = $ret['data']['transactions'];
            $pos = $ret['data']['lastblock'];
            foreach ($list as $key => $value) {   
                $from = $value['from'];
                $to = $value['to'];     
                $amount  = gmp_init($value['value'],16);
                $amount  = round(gmp_strval($amount ,10)/pow(10,18),8) ;//转为十进制 
                $blockhash = $value['blockHash'];
                $gas_price =  gmp_init($value['gasPrice'],16);
                $gas_price  = gmp_strval($gas_price ,10)/pow(10,18);//转为十进制 
                $gas =  gmp_init($value['gas'],16);
                $gas  = gmp_strval($gas ,10);//转为十进制 
                $fee = $gas*$gas_price;
                $txid = $value['hash'];
                $memo = "";
                //判断发送方
                if (in_array($from,$address_list)){
                    $this->confirm_transfer($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);                  
                }
                //判断接收方
                if (in_array($to,$address_list)){
                   $this->add_transfer_log($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);
                }
            }
            $this->update_rpc_last_pos($coin_symbol,$pos);         
        }

        if($coin_symbol=='XRP'){
            $ret = $this->rpc_get_transactions($coin_symbol);
            if($ret['code']==0){
                die($ret['msg']);
            }
            var_dump($ret);
            $list = $ret['data']['transactions'];
            $pos = $ret['data']['lastblock'];
            //$pos = $ret['data']['transactions'];
            $addr = "rMVm2PSvCWoQJj2AoYsPATuWXj6HMeGvLe";
            foreach ($list as $key => $value) {
                $from= $value['tx']['Account'];
                $to = $value['tx']['Destination'];
                $amount = floatval($value['tx']['Amount'])/pow(10,6);
                $fee = floatval($value['tx']['Fee'])/pow(10,6);
                $blockhash = "";
                $txid = $value['hash'];
                
                if(isset($value['tx']['DestinationTag'])){
                    $memo = $value['tx']['DestinationTag'];
                    if($to == $addr ){
                       //$this->add_transfer_log($coin_symbol,$addr,$memo,$amount,$blockhash,$txid);
                       $this->add_transfer_log($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);
                    }
                    if($from == $addr){
                       //$this->confirm_transfer($coin_symbol,$addr,$memo,$amount,$blockhash,$txid);
                       $this->confirm_transfer($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid);  
                    }
                    echo  $txid." , ".$from." , ".$to." ,".$amount.", ".$memo."\r\n";
                }
            }
            $this->update_rpc_last_pos($coin_symbol,$pos);      
        }      

        if($coin_symbol=='EOS'){
            $ret = $this->rpc_get_transactions($coin_symbol);
            if($ret['code']==0){
                die($ret['msg']);
            }
            $list = $ret['data']['transactions'];
            $pos = $ret['data']['lastblock'];
            //$pos = $ret['data']['transactions'];
            $addr = "dandanyatou1";
            foreach ($list as $key => $value) {
                var_dump($value);
                $from= $value['sender'];
                $to = $value['receiver'];
                $amount = $value['quantity'];
                $blockhash = $value['block_num'];
                $txid = $value['trx_id'];   
                if(isset($value['memo'])){
                    if(!empty($value['memo'])){
                        $memo = $value['memo'];
                        if($to == $addr ){
                           //$this->add_transfer_log($coin_symbol,$addr,$memo,$amount,$blockhash,$txid);
                           $this->add_transfer_log($coin_symbol,$from,$to,$memo,$amount,0,$blockhash,$txid);
                        }
                        if($from == $addr){
                           //$this->confirm_transfer($coin_symbol,$addr,$memo,$amount,$blockhash,$txid);
                           $this->confirm_transfer($coin_symbol,$from,$to,$memo,$amount,0,$blockhash,$txid); 
                        }                       
                    }

                   // echo  $txid." , ".$from." , ".$to." ,".$amount.", ".$memo."\r\n";
                }
            }
            $this->update_rpc_last_pos($coin_symbol,$pos);      
        }  

    }

    function rpc_get_transactions($coin_symbol){
        $coin = strtolower($coin_symbol); 
        $vendor_name = "Chain.".$coin."rpc";
        Vendor($vendor_name);
        $class_name = "\\".$coin."rpc";
        //检测钱包是否存在
        $fieldStr = 'rpc_ip,rpc_port,rpc_user,rpc_pass,rpc_last_pos';
        $coin_data = Db::name('coin')
        ->field($fieldStr)
        ->where('coin_symbol', $coin_symbol)
        ->find();
        if(empty($coin_data)){ //没有该币种
            return array('code'=>0,'msg'=>"coin symbol not exists");  
        }
        //币种rpc配置
        $rpc_ip = $coin_data['rpc_ip'];
        $rpc_port = $coin_data['rpc_port'];
        $rpc_user = $coin_data['rpc_user'];
        $rpc_pass = $coin_data['rpc_pass'];       
        //RPC连接
        $rpc = new $class_name($rpc_ip,$rpc_port,$rpc_user,$rpc_pass);    
        if (!method_exists($rpc,"get_Transactions")) {
            return array('code'=>0,'msg'=>"$class_name method get_Transactions not exists");   
        }
        dump($coin_data['rpc_last_pos']);
        $ret = $rpc->get_Transactions($coin_data['rpc_last_pos']); 
         dump(count($ret));

        if($ret['code'] == 1){
             return array('code'=>1,'msg'=>"$class_name method: get_Transactions ok",'data'=>$ret['data']);     
        }else{
             return array('code'=>0,'msg'=>"$class_name get_Transactions error:".$ret['data'],'data'=>array());              
        }  
                         
    }

    function rpc_get_transaction_receipt($coin_symbol,$txid){
        $coin = strtolower($coin_symbol); 
        $vendor_name = "Chain.".$coin."rpc";
        Vendor($vendor_name);
        $class_name = "\\".$coin."rpc";
        //检测钱包是否存在
        $fieldStr = 'rpc_ip,rpc_port,rpc_user,rpc_pass,rpc_last_pos';
        $coin_data = Db::name('coin')
        ->field($fieldStr)
        ->where('coin_symbol', $coin_symbol)
        ->find();
        if(empty($coin_data)){ //没有该币种
            return array('code'=>0,'msg'=>"coin symbol not exists");  
        }
        //币种rpc配置
        $rpc_ip = $coin_data['rpc_ip'];
        $rpc_port = $coin_data['rpc_port'];
        $rpc_user = $coin_data['rpc_user'];
        $rpc_pass = $coin_data['rpc_pass'];       
        //RPC连接
        $rpc = new $class_name($rpc_ip,$rpc_port,$rpc_user,$rpc_pass);    
        if (!method_exists($rpc,"get_TransactionReceipt")) {
            return array('code'=>0,'msg'=>"$class_name method get_TransactionReceipt not exists");   
        }
        $ret = $rpc->get_TransactionReceipt($txid); 
        if($ret['code'] == 1){
             return array('code'=>1,'msg'=>"$class_name method: get_TransactionReceipt ok",'data'=>$ret['data']);     
        }else{
             return array('code'=>0,'msg'=>"$class_name get_TransactionReceipt error:".$ret['data'],'data'=>array());              
        }  
                         
    }

    function update_rpc_last_pos($coin_symbol,$pos){
        $data['rpc_last_pos'] = $pos;
        Db::name('coin')->where('coin_symbol', $coin_symbol)->update($data);
    }

    public function add_transfer_log($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid){
        //先查找交易是否存在
        $find = Db::name('transfer_log')
        ->field("id")
        ->where('type', 3)
        ->where('tx_id', $txid)
        ->find();

        if($find){
            return;
        }
        //先查找地址
        //获取用户钱包余额    
        $walletData = Db::name('wallet')
        ->field("id,chain_balance")
        ->where('address', $to)
        ->where('memo',$memo)
        ->where('coin_symbol',$coin_symbol)
        ->find();

        if(empty($walletData))
            return;  
        //开始事务处理
        Db::startTrans();
        $result = Db::name('wallet')
        ->where('id', $walletData['id'] )
        ->setInc('chain_balance',$amount);
        if(!$result){
            Db::rollback();
            //$this->error('转账提交失败(#1)！'); 
            return;         
        }          
        $balance =  $walletData['chain_balance'];
        //获取新余额
        $balance_data = Db::name('wallet')
        ->field('chain_balance')
        ->where('id', $walletData['id'] )
        ->find();
        //写入交易日志
        $balance_after =  $balance_data['chain_balance'];
        $insert_data['type'] =  3 ; 
        $insert_data['wallet_id'] = $walletData['id'] ;
        $insert_data['coin_symbol'] =  $coin_symbol;
        $insert_data['from_address'] =  $from;
        $insert_data['to_address'] =  $to;
        $insert_data['amount'] =  $amount;
        $insert_data['amount_before'] =   $balance;
        $insert_data['amount_after'] =   $balance_after;
        $insert_data['fee'] =   $fee;
        $insert_data['log_time'] =  time();
        $insert_data['memo'] ='';
        $insert_data['blockhash'] = $blockhash;
        $insert_data['tx_id'] =$txid;
        $insert_data['transfer_status'] = 1;
        $result = Db::name('transfer_log')->insertGetId($insert_data);  
        if($result){
            //增加任务

            if(($coin_symbol!='XRP')&&($coin_symbol!='EOS')){
                $p = array();  
                $p['wallet_id'] =  $walletData['id'];                 
                $task_data['params'] = json_encode($p);
                $task_data['task_name'] = "update_wallet_balance";
                $task_data['wallet_id'] =$walletData['id'];
                $task_data['schedule_time'] =0;
                Db::name('cron')->insert($task_data);                      
            }else{
                //XRP EOS
            }
            $p['transaction_id'] = $result;
            $p['notify_type'] = "payment";
            $task_data['params'] = json_encode($p);
            $task_data['task_name'] = "notify_url";
            $task_data['wallet_id'] =$walletData['id'];
            $task_data['schedule_time'] =0;
            Db::name('cron')->insert($task_data);   

            Db::commit();
            //$this->success('转账提交成功！');
            return;
        }else{
            Db::rollback();
            //$this->error('转账提交失败(#2)！');
            return;        
        }                      
    
   
          
        
    }

    public function confirm_transfer($coin_symbol,$from,$to,$memo,$amount,$fee,$blockhash,$txid){
        //写入交易日志

        $logs = Db::name('transfer_log')
        ->field('id,wallet_id,to_wallet_id,coin_symbol,type')
        ->where('tx_id',$txid)
        ->where('transfer_status',2)
        ->select()->toArray();  
        foreach ($logs as $key => $value) {
            $log_id = $value['id'];
            $update_data['transfer_status'] = 1;
            $update_data['fee'] = $fee;
            Db::name('transfer_log')->where('id',$log_id)->update($update_data);
            
            $p = array();  
            $p['wallet_id'] =  $value['wallet_id']; 
            $task_data['params'] = json_encode($p);
            $task_data['task_name'] = "update_wallet_balance";
            $task_data['wallet_id'] =$value['wallet_id'];
            $task_data['schedule_time'] =0;
            Db::name('cron')->insert($task_data);
            if($value['to_wallet_id']>0){
                if(($coin_symbol!='XRP')&&($coin_symbol!='EOS')){
                    $p = array();  
                    $p['wallet_id'] =  $value['to_wallet_id']; 
                    $task_data['params'] = json_encode($p);
                    $task_data['task_name'] = "update_wallet_balance";
                    $task_data['wallet_id'] =$value['to_wallet_id'];
                    $task_data['schedule_time'] =0;
                    Db::name('cron')->insert($task_data);
                }else{
                    //XRP EOS
                    //$result = Db::name('wallet')
                    //->where('id',$value['to_wallet_id'])
                    //->setInc('chain_balance',$amount);
                }
            }
            if(($value['type']!=4)&&($value['type']!=5)){
                $p = array();     
                $p['transaction_id'] =  $value['id'];
                $p['notify_type'] = "confirm";
                $task_data['params'] = json_encode($p);
                $task_data['task_name'] = "notify_url";
                $task_data['wallet_id'] =$value['wallet_id'];
                $task_data['schedule_time'] =0;
            }

            Db::name('cron')->insert($task_data);                           
        }

        if(!empty($from)){

            //更新余额
            $wallet = Db::name('wallet')
            ->field('id,address')
            ->where('address',$from)
            ->find();  
            //var_dump($from);
            //var_dump($wallet);
            //增加任务
            if(($coin_symbol!='XRP')&&($coin_symbol!='EOS')){
                $p = array();  
                $p['wallet_id'] =  $wallet['id'];                 
                $task_data['params'] = json_encode($p);
                $task_data['task_name'] = "update_wallet_balance";
                $task_data['wallet_id'] =$wallet['id'];
                $task_data['schedule_time'] =0;
                Db::name('cron')->insert($task_data);  
            }else{
                //XRP EOS
            }
            $insert_data = array();
            $insert_data['tx_id'] = $txid;
            $insert_data['coin_symbol'] =  $coin_symbol;
            $insert_data['from_address'] =  $from;
            $insert_data['to_address'] =  $to;
            $insert_data['memo'] =   $memo;
            $insert_data['amount'] =  $amount;
            $insert_data['fee'] =  $fee;
            $insert_data['block_hash'] = $blockhash;
            $insert_data['log_time'] =  time();
            $result = Db::name('chain_log')->insertGetId($insert_data);  
            

        }
  
    }

}
