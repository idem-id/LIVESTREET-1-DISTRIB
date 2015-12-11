{if $oBlog}
  {assign var="itemtype" value='http://schema.org/Blog'}
  {assign var="prefix" value="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# article: http://ogp.me/ns/article#"}
{elseif $oTopic}
  {assign var="itemtype" value='http://schema.org/Blog'}
  {assign var="prefix" value="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# article: http://ogp.me/ns/article#"}
{elseif $oUserProfile}
  {assign var="itemtype" value=''}
  {assign var="prefix" value="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# profile: http://ogp.me/ns/profile#"}
{else}
  {assign var="itemtype" value='http://schema.org/Blog'}
  {assign var="prefix" value="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#"}
{/if}

<!DOCTYPE html>
<html class="no-js" lang="ru-RU"
      itemscope="" itemtype="{$itemtype}"
      prefix="{$prefix}">
<head>
  {hook run='html_head_begin'}

  <meta charset="utf-8" />
  <!--[if IE]>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <![endif]-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>{$sHtmlTitle}</title>

  {include file='custom/header.metadata.tpl'}

  {$aHtmlHeadFiles.css}

  <link href="{cfg name='path.static.skin'}/images/favicon.ico?v1" rel="shortcut icon" />
  <link rel="search" type="application/opensearchdescription+xml" href="{router page='search'}opensearch/" title="{cfg name='view.name'}" />


  {if $aHtmlRssAlternate}
    <link rel="alternate" type="application/rss+xml" href="{$aHtmlRssAlternate.url}" title="{$aHtmlRssAlternate.title}" />
  {/if}

  {if $sHtmlCanonical}
    <link rel="canonical" href="{$sHtmlCanonical}" />
  {/if}

  {if $bRefreshToHome}
    <meta  HTTP-EQUIV="Refresh" CONTENT="3; URL={cfg name='path.root.web'}/" />
  {/if}


  <script type="text/javascript">
    var DIR_WEB_ROOT            = '{cfg name="path.root.web"}';
    var DIR_STATIC_SKIN         = '{cfg name="path.static.skin"}';
    var DIR_ROOT_ENGINE_LIB     = '{cfg name="path.root.engine_lib"}';
    var LIVESTREET_SECURITY_KEY = '{$LIVESTREET_SECURITY_KEY}';
    var SESSION_ID              = '{$_sPhpSessionId}';
    var BLOG_USE_TINYMCE        = '{cfg name="view.tinymce"}';

    var TINYMCE_LANG = 'en';
    {if $oConfig->GetValue('lang.current') == 'russian'}
      TINYMCE_LANG = 'ru';
    {/if}

    var aRouter = new Array();
    {foreach from=$aRouter key=sPage item=sPath}
      aRouter['{$sPage}'] = '{$sPath}';
    {/foreach}
  </script>


  {$aHtmlHeadFiles.js}


  <script type="text/javascript">
    var tinyMCE = false;
    ls.lang.load({json var = $aLangJs});
    ls.registry.set('comment_max_tree',{json var=$oConfig->Get('module.comment.max_tree')});
    ls.registry.set('block_stream_show_tip',{json var=$oConfig->Get('block.stream.show_tip')});
  </script>


  {hook run='html_head_end'}


  <script type="text/javascript">
    function toggleCodes(on) {
      var obj = document.getElementById('icons');
      if (on) {
        obj.className += ' codesOn';
      } else {
        obj.className = obj.className.replace(' codesOn', '');
      }
    }
  </script>


  {if {cfg name='masonry.add'} == true and $bTopicListPage}
    <script type="text/javascript" src="{cfg name="path.static.skin"}/js/masonry/masonry.pkgd.min.js"></script>
    <script type="text/javascript" src="{cfg name="path.static.skin"}/js/masonry/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="{cfg name="path.static.skin"}/js/masonry/masonry-default.js"></script>
  {/if}
</head>



{if $oUserCurrent}
  {assign var=body_classes value=$body_classes|cat:' ls-user-role-user'}

  {if $oUserCurrent->isAdministrator()}
    {assign var=body_classes value=$body_classes|cat:' ls-user-role-admin'}
  {/if}
{else}
  {assign var=body_classes value=$body_classes|cat:' ls-user-role-guest'}
{/if}

{if !$oUserCurrent or ($oUserCurrent and !$oUserCurrent->isAdministrator())}
  {assign var=body_classes value=$body_classes|cat:' ls-user-role-not-admin'}
{/if}

{if {cfg name='view.layout'} == 'full-width'}
  {assign var=body_classes value=$body_classes|cat:' full-width'}
{elseif {cfg name='view.layout'} == 'boxed'}
  {assign var=body_classes value=$body_classes|cat:' boxed'}
{elseif {cfg name='view.layout'} == 'boxed-center'}
  {assign var=body_classes value=$body_classes|cat:' boxed-center'}
{/if}

{if {cfg name='container.lg'} == true and $noSidebar}
  {assign var=body_classes value=$body_classes|cat:' container-lg'}
{/if}

{if {cfg name='view.jumbotron'} == true}
  {assign var=body_classes value=$body_classes|cat:' jumbotron-in'}
{/if}



{add_block group='toolbar' name='toolbar_admin.tpl' priority=100}
{add_block group='toolbar' name='toolbar_scrollup.tpl' priority=-100}



<body class="{$body_classes} body-padding-{cfg name='navbar.position'} {cfg name='topic_list.view'}">
  {hook run='body_begin'}

  {if $oUserCurrent}
    {include file='window_write.tpl'}
    {include file='window_favourite_form_tags.tpl'}
  {else}
    {include file='window_login.tpl'}
  {/if}

  <div id="page-wrapper">
    {include file='header_top.tpl'}
    {include file='nav.tpl'}

    {hook run='content_top'}

    <section id="wrapper" class="{hook run='wrapper_class'}">
      <div id="container" class="container {hook run='container_class'}">
        <div class="row">

          {if !$noSidebar && $sidebarPosition == 'left'
          && $sAction != 'search'
          && $sAction != 'comments'}
            {include file='sidebar.tpl'}
          {/if}

          <div id="content-wrapper" role="main"
            class="{if $noSidebar
            || $sAction == 'search'
            || $sAction == 'comments'}col-md-12{else}col-md-8{/if} content{if $sidebarPosition == 'left'} content-right{/if}"
            {if $sMenuItemSelect=='profile'}itemscope="" itemtype="http://schema.org/Person"{/if}>

            {include file='nav_content.tpl'}
            {include file='system_message.tpl'}

            {hook run='content_begin'}
