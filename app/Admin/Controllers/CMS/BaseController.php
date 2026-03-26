<?php

namespace App\Admin\Controllers\CMS;

use App\Models\GlobalConfig;
use Encore\Admin\Controllers\AdminController;
use Illuminate\Support\Facades\View;

class BaseController extends AdminController
{
    public function __construct()
    {
        $configs = GlobalConfig::all()->pluck('value', 'code');
        View::share('configs', $configs);
    }
}