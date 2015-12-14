{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

{assign var="topicAuthorImg" value="{$oTopic->getUser()->getProfileFotoPath()}"}
{assign var="topicImg" value="{$oTopic->getPreviewImageWebPath({cfg name='meta.thumbnail.img_size'})}"}
{if !$oTopic->getPreviewImageWebPath()}
  {assign var="topicImg" value="{$topicAuthorImg}"}
{/if}

<article class="topic topic-type-{$oTopic->getType()} js-topic" itemprop="blogPost" itemscope="" itemtype="http://schema.org/BlogPosting">
  <meta itemprop="mainEntityOfPage" itemid="{$oTopic->getUrl()}" />
  <meta itemprop="image" content="{$topicImg}" />
  <meta itemprop="commentCount" content="{$oTopic->getCountComment()}" />
  <meta itemprop="dateModified" content="{$oTopic->getDateEdit()}" />
  <header class="topic-header">
    {if $bTopicList}<h2 class="topic-title" itemprop="name headline">{else}<h1 class="topic-title" itemprop="name headline">{/if}
      {if $bTopicList}
        <a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a>
      {else}
        {$oTopic->getTitle()|escape:'html'}
      {/if}

      {if $oTopic->getPublish() == 0}
        <span class="glyphicon glyphicon-file text-muted" title="{$aLang.topic_unpublish}"></span>
      {/if}
    {if $bTopicList}</h2>{else}</h1>{/if}

    <ul class="list-unstyled list-inline small topic-info">
      <li class="topic-info-blog">
        <a href="{$oBlog->getUrlFull()}" class="topic-blog" rel="category tag">{$oBlog->getTitle()|escape:'html'}</a>
      </li>
      <li class="topic-info-date">
        <a href="{$oTopic->getUrl()}" title="{date_format date=$oTopic->getDateAdd() format='H:i'}" rel="bookmark" itemprop="url">
          <time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}" class="text-muted" itemprop="datePublished">
            {date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
          </time>
        </a>
      </li>
      {if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
        <li><a href="{cfg name='path.root.web'}/{$oTopic->getType()}/edit/{$oTopic->getId()}/" title="{$aLang.topic_edit}" class="actions-edit"><i class="fa fa-pencil fa-fw"></i></a></li>

        {if $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getOwnerId()==$oUserCurrent->getId()}
          <li><a href="{router page='topic'}delete/{$oTopic->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.topic_delete}" onclick="return confirm('{$aLang.topic_delete_confirm}');" class="actions-delete"><i class="fa fa-trash-o fa-fw"></i></a></li>
        {/if}
      {/if}
    </ul>
  </header>
