<?php
namespace app\admin\controller;
use cmf\controller\AdminBaseController;
use think\Db;
use app\admin\model\ExchangeModel;
/**
 * Class TransferLogController 转账记录
 * @package app\admin\controller
 */
class ChainLogController extends AdminBaseController
{
    public function index(){
        $size=20;
        $where=[];

        $requ= request()->param();
        !empty($requ['tx_id']) ? $where['a.tx_id'] = $requ['tx_id'] : '';        
        !empty($requ['transfer_id']) ? $where['b.id'] = $requ['transfer_id'] : '';  

        $transfer_status = [
            "-1" => "<font color='#ff0000'>转账失败</font>",
            "0"  => "",
            "1"  => "<font color='#008B45'>转账成功</font>",
        ];

        $data=  
        Db::name('chain_log')
        ->alias('a')
        ->join(config('database.prefix').'transfer_log b',"a.tx_id = b.tx_id")
        ->field('a.*,b.id as transfer_id')
        ->where($where)
        ->order("id desc")
        ->paginate($size , false, [  'query' =>request()->param()  ]    );

        $this->assign('request', $requ ); 
        $this->assign('transfer_status', $transfer_status );
        $this->assign('datas', $data->items() );
        $this->assign('num', $data->total());
        $this->assign('page',$data->render() );
    
        return $this->fetch();
    }
}