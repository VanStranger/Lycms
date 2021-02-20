<?php
namespace application\admin\controller;
use \application\admin\model as Model;
use ly\lib\Controller;
use \ly\lib\DB as DB;
class Index extends Controller{
    public function __construct(){
        // echo "construct";
    }
    public $hook=[
        "pre"
    ];
    public function pre(){
        
    }
    public function index(){
        $step=input("step");
        $tempname="step-1";
        switch ($step) {
            case '2':
                $tempname="step-2";
                break;
            case '3':
                $tempname="step-3";
                break;
            case '4':
                $tempname="step-4";
                break;
            case '5':
                $tempname="step-5";
                break;
            
            default:
                # code...
                break;
        }
        $this->displayHtml($tempname);
    }
    
}