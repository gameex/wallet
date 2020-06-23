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

class CronController extends RestBaseController
{

    public function index()
    {
        //查询任务
        $fieldStr = 'id,task_name,params,wallet_id,fail_times';
        $tasks = Db::name('cron')
        ->field($fieldStr)
        ->where('status',0)
        ->where('schedule_time','lt',time())
        ->order('schedule_time asc,id asc')
        ->select()->toArray();

        foreach ($tasks as $key => $task) {
            //执行对应的任务
            $result = array('code'=>0,'msg'=>"");
            $task_id = $task['id'];
            $fail_times = $task['fail_times'];
            $fun_name = $task['task_name'];
          dump($task['task_name']);
            if(!empty($task['params'])){
                $params = json_decode($task['params'],true);
             }else{
                $params = array();
             }
            if (method_exists($this,$fun_name)) {
                $ret = $this->$fun_name($params);
                $result = array('code'=>$ret['code'],'msg'=>$ret['msg']);
            }else{
                $result = array('code'=>0,'msg'=>"function $fun_name not exists");
            }
          dump($result);
            //标记任务状态
            $update_data = array();
            if($result['code']==0){
                $fail_times = $fail_times + 1;
                $update_data['result'] = $result['msg'];
                $update_data['fail_times'] = $fail_times;
                if( $fail_times > 3){ //失败超过三次 就
                   $update_data['status'] = -1; 
                }else{
                   $update_data['status'] =  0;  
                   $update_data['schedule_time'] =  time()+ $fail_times*15;  //延迟再次执行                                   
                }
                $result = Db::name('cron')->where('id',$task_id)->update($update_data);
            }else{
                $update_data['status'] =  1;  
                $update_data['result'] = $result['msg'];
                $result = Db::name('cron')->where('id',$task_id)->update($update_data);
            } 
        }

    }


    //更新钱包余额
    function update_wallet_balance($params){

        $wallet_id = $params['wallet_id'];
       // $wallet_id = 429;
        //检测钱包是否存在
        $fieldStr = 'coin_type,a.coin_symbol,uuid,contract,decimals,parent_coin,rpc_ip,rpc_port,rpc_user,rpc_pass,b.id,b.address,IFNULL(b.status,-1) as status';
        $coin_data = Db::name('coin')
        ->alias('a')
        ->join(config('database.prefix').'wallet b',"a.coin_symbol = b.coin_symbol and b.id = $wallet_id")
        ->field($fieldStr)
        ->find();

        if(empty($coin_data)){ //没有该币种
            return array('code'=>1,'msg'=>"coin symbol not exists");  
        }
        if(empty($coin_data['address'])){
            return array('code'=>1,'msg'=>"user wallet not exists");    
        }
        $wallet_id = $coin_data['id']; 
        $coin_symbol = $coin_data['coin_symbol'];
        $userId = $coin_data['uuid'];

        //币种rpc配置
        if($coin_data['coin_type'] == 'coin'){
           $coin = strtolower($coin_symbol);  
           $rpc_ip =   $coin_data['rpc_ip'];
           $rpc_port = $coin_data['rpc_port'];
           $rpc_user = $coin_data['rpc_user'];
           $rpc_pass = $coin_data['rpc_pass'];            
        }else{
           $coin = strtolower($coin_data['parent_coin']);
           $parent_coin_data = Db::name('coin')
            ->field('rpc_ip,rpc_port,rpc_user,rpc_pass')
            ->where('coin_symbol',$coin_data['parent_coin'])
            ->find();           
           $rpc_ip =   $parent_coin_data['rpc_ip'];
           $rpc_port = $parent_coin_data['rpc_port'];
           $rpc_user = $parent_coin_data['rpc_user'];
           $rpc_pass = $parent_coin_data['rpc_pass'];             
        }    
        if(empty($rpc_ip)||empty($rpc_port)){
            return array('code'=>0,'msg'=>"rpc ip or port not set");            
        }    
        $vendor_name = "Chain.".$coin."rpc";
        Vendor($vendor_name);
        $class_name = "\\".$coin."rpc";
        if(!class_exists($class_name)){
            return array('code'=>0,'msg'=>"$class_name not exists");
        }                      
         
        //RPC连接
        $rpc = new $class_name($rpc_ip,$rpc_port,$rpc_user,$rpc_pass);    
        //查询余额
        if($coin_data['coin_type'] == 'coin'){
            //如果是USDT要先查询下BTC手续费余额
            if($coin_symbol=="USDT"){
                $api_method = "get_Balance_BTC";
                if (!method_exists($rpc,$api_method)) {
                    return array('code'=>0,'msg'=>"$class_name method $api_method not exists");   
                }
               //$ret = $rpc->$api_method($coin_data['address']); 
               $base_url= "https://chain.api.btc.com/v3/address/";
               $url = $base_url.$coin_data['address'];
               $result = $this->curl_get($url);
               $ret = json_decode($result,true);

               if($ret['err_no'] == 0){
                  //echo $ret['data']['balance']/pow(10,8);    
               //}
                //if($ret['code'] == 1){
                     $update_data = array();
                     //$update_data['chain_balance_fee'] = $ret['data']['balance'];    
                     //var_dump($ret);
                     $update_data['chain_balance_fee'] =  $ret['data']['balance']/pow(10,8); 
                     
                     $result = Db::name('wallet')->where('id',$wallet_id)->update($update_data);
                     //var_dump($update_data['chain_balance_fee'] );die(); 
                }else{
                     //return array('code'=>0,'msg'=>"$class_name $api_method error:".$ret['data']);  
                     return array('code'=>0,'msg'=>"$class_name $api_method error:".$result);             
                }
            }
            $api_method = "get_Balance";
            if (!method_exists($rpc,$api_method)) {
                return array('code'=>0,'msg'=>"$class_name method $api_method not exists");   
            }
            $ret = $rpc->$api_method($coin_data['address']); 
//dump($ret);
            if($ret['code'] == 1){
                 $update_data = array();
                 $update_data['chain_balance'] = $ret['data']['balance'];    
                  //dump($wallet_id); dump($update_data);
                 $result = Db::name('wallet')->where('id',$wallet_id)->update($update_data);
                 $balance = $update_data['chain_balance'];
                 return array('code'=>1,'msg'=>"$class_name method $api_method ok : $userId  $coin_symbol $balance");  
            }else{
                 return array('code'=>0,'msg'=>"$class_name $api_method error:".$ret['data']);              
            }              
        }else{
            if($coin_data['parent_coin'] == 'ETH'){
                //先查询下ETH的额度
                $api_method = "get_Balance";
                if (!method_exists($rpc,$api_method)) {
                    return array('code'=>0,'msg'=>"$class_name method $api_method not exists");   
                }
                $ret = $rpc->$api_method($coin_data['address']); 
                if($ret['code'] == 1){
                     $update_data = array();
                     $update_data['chain_balance_fee'] = $ret['data']['balance'];    
                      //dump($wallet_id); dump($update_data);
                     $result = Db::name('wallet')->where('id',$wallet_id)->update($update_data);
                     //$balance = $update_data['chain_balance'];
                     //return array('code'=>1,'msg'=>"$class_name method $api_method ok : $userId  $coin_symbol $balance");  
                }else{
                     return array('code'=>0,'msg'=>"$class_name $api_method error:".$ret['data']);              
                }
                //再查询token的数量
                $api_method = "get_TokenBalance";
                if (!method_exists($rpc,$api_method)) {
                    return array('code'=>0,'msg'=>"$class_name method $api_method not exists");   
                }
                $ret = $rpc->$api_method($coin_data['address'],$coin_data['contract'],$coin_data['decimals']); 
               //$ret = $rpc->$api_method("0x54f3e53bea04a3989114b8885ac16cc0fadcf2ec",$coin_data['contract'],$coin_data['decimals']); 
                //var_dump($ret);
                if($ret['code'] == 1){
                     $update_data = array();
                     $update_data['chain_balance'] = $ret['data']['balance'];                 
                     $result = Db::name('wallet')->where('id',$wallet_id)->update($update_data);
                     //var_dump($result);
                     $balance = $update_data['chain_balance'];
                     return array('code'=>1,'msg'=>"$class_name method $api_method ok : $userId  $coin_symbol $balance");  
                }else{
                     return array('code'=>0,'msg'=>"$class_name $api_method error:".$ret['data']);              
                } 
            }else{
                $parent_coin = $coin_data['parent_coin'];
                return array('code'=>1,'msg'=>"$parent_coin token : $coin_symbol not support now");
            }                
        }     
      
    }
    
    //notify_url
    function notify_url($params){
      var_dump($params);
        $sys_config = cmf_get_option("sys_config");

        if(empty($sys_config['notify_url'])){
            return array('code'=>0,'msg'=>"notify_url not set");
        } 
        $notify_url = $sys_config['notify_url'];   
        
        //var_dump($notify_url);

        $transaction=  Db::name('transfer_log')
        ->where("id",$params['transaction_id']) 
        ->find();    

        if(empty($transaction)){
            return array('code'=>0,'msg'=>"transaction ".$params['transaction_id']." not found");
        }

        $wallet=  Db::name('wallet')
        ->where("id",$transaction['wallet_id']) 
        ->find();  

        if(empty($wallet)){
            return array('code'=>0,'msg'=>"wallet ".$transaction['wallet_id']." not found");
        }

        $post_param = array();
        $post_param['notify_type'] = $params['notify_type'];
        $post_param['transaction_id'] = $params['transaction_id'];

        $post_param['transaction_no'] = $transaction['transaction_no'];
        $post_param['wallet_id'] = $transaction['wallet_id'];

        $post_param['from_address'] = $transaction['from_address'];
        if(empty($post_param['from_address'])){
            $post_param['from_address'] = '-';
        }
        $post_param['wallet_memo'] = $wallet['memo'];
        
        $post_param['coin_symbol'] = $transaction['coin_symbol'];
        $post_param['to_address'] = $transaction['to_address'];
        if(empty($post_param['to_address'])){
            $post_param['to_address'] = '-';
        }        
        if($params['notify_type']=='payment'){
            $post_param['amount'] = abs($transaction['amount']);
        }else{
            $post_param['amount'] = $transaction['amount'];           
        }
        $post_param['fee'] = $transaction['fee'];
        $post_param['tx_id'] = $transaction['tx_id'];

        $post_param = $this->buildRequestPara($post_param);

        //var_dump($post_param);

        $ret = $this->curl_get($notify_url,$post_param,1);

        $update_data = array();

        if($ret=='success'){           
            $update_data['notify_status'] = 1;
            Db::name('transfer_log')
            ->where("id",$params['transaction_id']) 
            ->update($update_data);     
            return array('code'=>1,'msg'=>"sucess");
        }else{
            $update_data['notify_status'] = -1;
            Db::name('transfer_log')
            ->where("id",$params['transaction_id']) 
            ->update($update_data);                 
            return array('code'=>0,'msg'=>$ret);
        }
    }

    //汇总

    function collect($params){
        $sys_config = cmf_get_option("sys_config");
        $interval =  intval($sys_config['huizong_interval']);
        
        //总开关
        //if(empty($sys_config['huizong_auto'])){
            //写入下一个任务
            //$task_data['params'] = "";
            //$task_data['task_name'] = "collect";
            //$task_data['wallet_id'] = 0;
            //$task_data['schedule_time'] = time() + $interval;
            //Db::name('cron')->insert($task_data);
                    
            //return array('code'=>1,'msg'=>"huizong_auto not open");
        //}

        
        //先找到满足最小汇总金额的钱包
        $records = Db::name('wallet')
        ->alias('a')
        ->join(config('database.prefix').'coin b',"a.coin_symbol = b.coin_symbol","LEFT")
        ->field('a.id,a.chain_balance,a.coin_symbol,a.address,b.collect_min,b.collect_max,b.collect_status')
        ->where('a.chain_balance >= b.collect_min and b.collect_status = 1 and a.depot_status = 0')
        ->select();
        //var_dump($records);die();

        foreach ($records as $key => $value) {

            $max_amount =  floatval($value['collect_max']);

            $wallet_id = $value['id']; 
            $from_address = $value['address'];
            $coin_symbol = $value['coin_symbol'];
            $balance = floatval($value['chain_balance']);
            $amount = min($balance,$max_amount);
   
            $to_address_data =  Db::name('wallet')
            ->field("id,address")
            ->where('coin_symbol', $coin_symbol)
            ->where('depot_status',1)
            ->find();

            if(empty($to_address_data)){
                continue;
            }

            $to_address =  $to_address_data['address'];
            $transaction_type = 4;
            $to_wallet_id = $to_address_data['id'];
                    
            //开始事务处理
            Db::startTrans();

            $insert_data = array();
            $insert_data['wallet_id'] = $wallet_id ;     
            $insert_data['to_wallet_id'] =  $to_wallet_id;   
            $insert_data['type'] =  $transaction_type ; 
            $insert_data['coin_symbol'] =  $coin_symbol;
            $insert_data['from_address'] =  $from_address;
            $insert_data['to_address'] =  $to_address;
            $insert_data['amount'] =  -$amount;
            $insert_data['amount_before'] =   $balance;
            $insert_data['log_time'] =  time();
            $insert_data['memo'] ='';
            $insert_data['transfer_status'] =  0;
            $insert_data['audit_status'] = 1;    
    
            $result = Db::name('transfer_log')->insertGetId($insert_data);  
            if($result){
                Db::commit();
            }else{
                Db::rollback();
            }  
        }     
        //写入下一个任务
        $task_data['params'] = "";
        $task_data['task_name'] = "collect";
        $task_data['wallet_id'] = 0;
        $task_data['schedule_time'] = time() + $interval;
        Db::name('cron')->insert($task_data);

        return array('code'=>1,'msg'=>"check ok"); 
    }

    //更新钱包余额   
    function curl_get($url,$params=false,$ispost=0){
        $httpInfo = array();
        $ch = curl_init();
     
        curl_setopt( $ch, CURLOPT_HTTP_VERSION , CURL_HTTP_VERSION_1_1 );
        curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT , 5 );
        curl_setopt( $ch, CURLOPT_TIMEOUT , 5);
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER , true );
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);  // 从证书中检查SSL加密算法是否存在        
        if( $ispost )
        {
            curl_setopt( $ch , CURLOPT_POST , true );
            curl_setopt( $ch , CURLOPT_POSTFIELDS , $params );
            curl_setopt( $ch , CURLOPT_URL , $url );
        }
        else
        {
            if($params){
                curl_setopt( $ch , CURLOPT_URL , $url.'?'.$params );
            }else{
                curl_setopt( $ch , CURLOPT_URL , $url);
            }
        }
        $response = curl_exec( $ch );
        if ($response === FALSE) {
            //echo "cURL Error: " . curl_error($ch);
            return false;
        }
        $httpCode = curl_getinfo( $ch , CURLINFO_HTTP_CODE );
        $httpInfo = array_merge( $httpInfo , curl_getinfo( $ch ) );
        curl_close( $ch );
        return $response;
    }


    public function rpc_test($coin_symbol,$userId,$api_method){
        $coin = strtolower($coin_symbol); 
        $vendor_name = "Chain.".$coin."rpc";
        Vendor($vendor_name);
        $class_name = "\\".$coin."rpc";
        //检测钱包是否存在
        $fieldStr = 'rpc_ip,rpc_port,rpc_user,rpc_pass,b.id,b.address,IFNULL(b.status,-1) as status';
        $coin_data = Db::name('coin')
        ->alias('a')
        ->join(config('database.prefix').'wallet b',"a.coin_symbol = b.coin_symbol and b.id = $userId ","LEFT")
        ->field($fieldStr)
        ->where('a.coin_symbol', $coin_symbol)
        ->find();
        if(empty($coin_data)){ //没有该币种
            return array('code'=>0,'msg'=>"coin symbol not exists");  
        }
        if(empty($coin_data['address'])){
            //return array('code'=>1,'msg'=>"user wallet not exists");    
        }
        //币种rpc配置
        $rpc_ip = $coin_data['rpc_ip'];
        $rpc_port =  $coin_data['rpc_port'];
        $rpc_user = $coin_data['rpc_user'];
        $rpc_pass = $coin_data['rpc_pass'];       
        //RPC连接
        $rpc = new $class_name($rpc_ip,$rpc_port,$rpc_user,$rpc_pass);  
          
 
        if (!method_exists($rpc,$api_method)) {
            return array('code'=>0,'msg'=>"$class_name method $api_method not exists");   
        }
        if($api_method == "get_Balance"){
            //var_dump($coin_data['address']);
           $ret = $rpc->$api_method($coin_data['address']); 
        }        
        if($api_method == "get_NewAddress"){
           $ret = $rpc->$api_method($userId); 
        }
        if($api_method == "get_BlockNumber"){
           $ret = $rpc->$api_method(); 
        }
        if($api_method == "get_Transactions"){
           $ret = $rpc->$api_method(""); 
        }        
        if($ret['code'] == 1){
             return array('code'=>1,'msg'=>"$class_name  method: $api_method ok",'data'=>$ret['data']);     
        }else{
             return array('code'=>0,'msg'=>"$class_name $api_method error:".$ret['data'],'data'=>array());              
        }  
                         
    }

  


    public function test(){
        $ret = $this->rpc_test("LTC",396396396,"get_NewAddress");
        var_dump($ret);die();
       // $ret = $this->rpc_test("BTC",320,"get_Balance");
        // var_dump($ret);
       // $ret = $this->rpc_test("BTC",3,"get_BlockNumber");
       //var_dump($ret);
       //$ret = $this->rpc_test("BTC",3,"get_Transactions");
       // var_dump($ret);


       // $rr = $ret['data']['transactions'];
       // var_dump($ret['data']);
       // foreach ($rr as $key => $value) {
        //    var_dump($value);
       // }
       $base_url= "https://chain.api.btc.com/v3/address/";
       $url = $base_url.'1NZBPytWPHxzk1s9VrQwHEwUt1CLoPTzjM';
       $result = $this->curl_get($url);

       $ret = json_decode($result,true);
       var_dump($ret );
       if($ret['err_no'] == 0){
          echo $ret['data']['balance']/pow(10,8);    
       }
    }    

}
