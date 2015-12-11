<header id="header" role="banner" itemscope="" itemtype="http://schema.org/WPHeader">
  <meta itemprop="headline" content="{cfg name='view.name'}" />
  <meta itemprop="description" content="{$sHtmlDescription}" />

  {hook run='header_banner_begin'}

  <nav class="navbar navbar-{cfg name='navbar.view'} navbar-{cfg name='navbar.position'}" role="navigation" itemscope="" itemtype="http://schema.org/SiteNavigationElement">
    <div class="container{if {cfg name='navbar.container.fluid'} == true}-fluid{/if}">

      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".header-navbar-collapse">
          <span class="sr-only">{$aLang.toggle_navigation}</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

        {include file='custom/sitename.tpl'}
      </div>

      {hook run='userbar_nav'}

      <div class="collapse navbar-collapse header-navbar-collapse">
        <ul class="nav navbar-nav">
          <li {if $sMenuHeadItemSelect=='blog'}class="active"{/if}><a href="{cfg name='path.root.web'}" itemprop="url"><i class="fa fa-file-text fa-fw"></i> <span itemprop="name">{$aLang.topic_title}</span></a></li>
          <li {if $sMenuHeadItemSelect=='blogs'}class="active"{/if}><a href="{router page='blogs'}" itemprop="url"><i class="fa fa-folder fa-fw"></i> <span itemprop="name">{$aLang.blogs}</span></a></li>
          <li {if $sMenuHeadItemSelect=='people'}class="active"{/if}><a href="{router page='people'}" itemprop="url"><i class="fa fa-users fa-fw"></i> <span itemprop="name">{$aLang.people}</span></a></li>
          <li {if $sMenuHeadItemSelect=='stream'}class="active"{/if}><a href="{router page='stream'}" itemprop="url"><i class="fa fa-bullhorn fa-fw"></i> <span itemprop="name">{$aLang.stream_menu}</span></a></li>

          {hook run='main_menu_item'}
        </ul>

        {hook run='main_menu'}

        <ul class="nav navbar-nav navbar-right">
          {if $oUserCurrent}
            {if $iUserCurrentCountTalkNew}
              <li {if $sAction=='talk'}class="active"{/if}>
                <a href="{router page='talk'}" class="new-messages" title="{if $iUserCurrentCountTalkNew}{$aLang.user_privat_messages_new}{/if}">
                  {$iUserCurrentCountTalkNew} <i class="fa fa-envelope fa-fw"></i>
                </a>
              </li>
            {else}
              <li {if $sAction=='talk'}class="active"{/if}>
                <a href="{router page='talk'}" class="old-messages" title="{$aLang.user_privat_messages}">
                  {$iUserCurrentCountTalkNew} <i class="fa fa-envelope fa-fw"></i>
                </a>
              </li>
            {/if}
            <li class="dropdown nav-userbar-username">
              <a data-toggle="dropdown" data-target="#" href="{$oUserCurrent->getUserWebPath()}" class="dropdown-toggle username">
                <img src="{$oUserCurrent->getProfileAvatarPath(24)}" alt="{$oUserCurrent->getLogin()}" class="avatar" />
                {$oUserCurrent->getLogin()}
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li class="item-stat">
                  <span class="strength" title="{$aLang.user_skill}"><i class="fa fa-bolt fa-fw"></i> {$oUserCurrent->getSkill()}</span>
                  <span class="rating {if $oUserCurrent->getRating() < 0}negative{/if}" title="{$aLang.user_rating}"><i class="fa fa-bar-chart fa-fw"></i> {$oUserCurrent->getRating()}</span>
                  {hook run='userbar_stat_item'}
                </li>
                <li class="divider"></li>
                <li><a href="{$oUserCurrent->getUserWebPath()}"><i class="fa fa-user fa-fw"></i> {$aLang.user_menu_profile}</a></li>
                <li><a href="{router page='talk'}" id="new_messages" title="{if $iUserCurrentCountTalkNew}{$aLang.user_privat_messages_new}{/if}">
                    {if $iUserCurrentCountTalkNew}<i class="fa fa-envelope fa-fw"></i>{else}<i class="fa fa-envelope-o fa-fw"></i>{/if}
                    {$aLang.user_privat_messages}{if $iUserCurrentCountTalkNew} <span class="messages-count">+{$iUserCurrentCountTalkNew}</span>{/if}</a></li>
                <li><a href="{$oUserCurrent->getUserWebPath()}wall/"><i class="fa fa-building-o fa-fw"></i> {$aLang.user_menu_profile_wall}</a></li>
                <li><a href="{$oUserCurrent->getUserWebPath()}created/topics/"><i class="fa fa-file-text-o fa-fw"></i> {$aLang.user_menu_publication}</a></li>
                <li><a href="{$oUserCurrent->getUserWebPath()}favourites/topics/"><i class="fa fa-bookmark-o fa-fw"></i> {$aLang.user_menu_profile_favourites}</a></li>
                <li><a href="{router page='settings'}profile/"><i class="fa fa-cog fa-fw"></i> {$aLang.user_settings}</a></li>
                {hook run='userbar_item'}
                <li><a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}"><i class="fa fa-sign-out fa-fw"></i> {$aLang.exit}</a></li>
              </ul>
            </li>
          {else}
            {hook run='userbar_item'}
            {if {cfg name='custom.form.login'}}
              <li><a href="{router page='login'}" class="js-login-form-show" rel="nofollow"><i class="fa fa-sign-in fa-fw"></i> {$aLang.user_login_submit}</a></li>
            {/if}
            {if {cfg name='custom.form.registration'}}
              <li class="hidden-sm"><a href="{router page='registration'}" class="js-registration-form-show" rel="nofollow"><i class="fa fa-user-plus fa-fw"></i> {$aLang.registration_submit}</a></li>
            {/if}
          {/if}
        </ul>
      </div>

    </div>
  </nav>


  {if {cfg name='view.jumbotron'} == true and {cfg name='view.layout'} !== 'boxed-center'}
    {include file='jumbotron.tpl'}
  {/if}


  {hook run='header_banner_end'}

</header>
