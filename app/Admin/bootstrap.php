<?php

use Encore\Admin\Form;
use Encore\Admin\Grid;

Encore\Admin\Form::forget(['map', 'editor']);
app('view')->prependNamespace('admin', resource_path('views/admin'));

Form::init(function (Form $form) {
    $form->disableEditingCheck();
    $form->disableCreatingCheck();
    $form->disableViewCheck();
});

Grid::init(function (Grid $grid) {
    $grid->expandFilter();
    $grid->disableColumnSelector();
    $grid->rows(function (Grid\Row $row) {
        $row->column('no', ($row->number + 1));
    });
    $grid->column('no');
});