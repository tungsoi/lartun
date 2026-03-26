<?php

namespace App\Admin\Controllers;

use App\Admin\Controllers\CMS\BaseController;
use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Content;

class HomeController extends BaseController
{
    public function index(Content $content): Content
    {
        return $content;
    }
}
