<aside class="main-sidebar">

    <section class="sidebar">

        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{auth()->user()->image_path}}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>{{auth()->user()->name }}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> @lang('site.statue')</a>
            </div>
        </div>

        <ul class="sidebar-menu" data-widget="tree">

            <li><a href="{{ route('dashboard.home') }}"><i
                        class="fa fa-th"></i><span>@lang('site.dashboard')</span></a></li>

           
            @if (auth()->user()->hasPermission('read-users'))
            <li><a href="{{ route('dashboard.users.index') }}"><i
                        class="fa fa-user"></i><span>@lang('site.users')</span></a></li>
            @endif

            @if (auth()->user()->can('read-roles'))
                   <li><a href="{{ route('dashboard.roles.index') }}"><i
                        class="fa fa-hourglass-half"></i><span>@lang('site.roles')</span></a></li>
            @endif
            @if (auth()->user()->can('read-husbands'))
                   <li><a href="{{ route('dashboard.husbands.index') }}"><i
                        class="fa fa-hourglass-half"></i><span>الازواج</span></a></li>
            @endif
            





        </ul>

    </section>

</aside>
