<?php

namespace App\Admin\Controllers\CMS;

use App\Models\GlobalConfig;
use Encore\Admin\Form;
use Encore\Admin\Grid;

class GlobalConfigsController extends BaseController
{
    protected $title = 'Global Config';

    protected function grid(): Grid
    {
        $grid = new Grid(new GlobalConfig());
        $grid->column('code');
        $grid->column('value');
        return $grid;
    }

    protected function form(): Form
    {
        $form = new Form(new GlobalConfig);
        $form->text('code')->rules(['required']);
        $form->text('value')->rules(['required']);
        return $form;
    }
}