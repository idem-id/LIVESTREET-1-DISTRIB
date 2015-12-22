{if $sAction=='index'}<h1 class="site-name">{else}<span class="site-name">{/if}
  <a class="navbar-brand" href="{cfg name='path.root.web'}">
    {if {cfg name='custom.logo.icon'}}
      <i class="fa fa-{cfg name='custom.logo.icon'}"></i>
    {/if}
    {if {cfg name='view.config_sitename'} == true}
      {cfg name='view.name'}
    {else}
      {cfg name='view.own_sitename'}
    {/if}
  </a>
{if $sAction=='index'}</h1>{else}</span>{/if}
