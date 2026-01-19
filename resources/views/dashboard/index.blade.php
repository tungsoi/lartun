<!doctype html>
<html lang="en" class="alternate-header header-is-scrolled">
@include("dashboard.header")
<body id="top" class="hs-content-id-174329775675 hs-site-page page hs-skip-lang-url-rewrite">
<div>
    <div class="header">
        <div class="header-inner">
            @include("dashboard.partials.header-banner")
            <div class="header-nav">
                @include("dashboard.partials.header-logo")
                @include("dashboard.partials.header-menu")
            </div>
        </div>
    </div>
</div>

<div class="container-fluid main">
    <div class="row-fluid-wrapper">
        <div class="row-fluid">
            <div class="span12 widget-span widget-type-cell" data-widget-type="cell" data-x="0" data-w="12">
                @include("dashboard.partials.banner")
                @include("dashboard.partials.counter")
                @include("dashboard.partials.partner")
                @include("dashboard.partials.short-description")
                @include("dashboard.partials.short-service")
                @include("dashboard.partials.banner-second")
                @include("dashboard.partials.about-service")
                @include("dashboard.partials.review")
                @include("dashboard.partials.break")
                @include("dashboard.partials.banner-image")
                @include("dashboard.partials.pen-test")
                @include("dashboard.partials.short-new")
                @include("dashboard.partials.award")
                @include("dashboard.partials.banner-third")
            </div>
        </div>
    </div>
</div>

@include("dashboard.partials.menu-footer")
@include("dashboard.footer")

</body>
</html>