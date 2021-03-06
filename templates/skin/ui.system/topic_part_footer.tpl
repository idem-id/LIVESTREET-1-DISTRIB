  {assign var="oBlog" value=$oTopic->getBlog()}
  {assign var="oUser" value=$oTopic->getUser()}
  {assign var="oVote" value=$oTopic->getVote()}
  {assign var="oFavourite" value=$oTopic->getFavourite()}


  <footer class="topic-footer">
    {if !$bTopicList}
      {if {cfg name='custom.topic.tags'}}
        <ul class="small text-muted list-unstyled list-inline topic-tags js-favourite-insert-after-form js-favourite-tags-topic-{$oTopic->getId()}" itemprop="keywords">
          <li><span class="glyphicon glyphicon-tags"></span></li>

          {strip}
            {if $oTopic->getTagsArray()}
              {foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
                <li>{if !$smarty.foreach.tags_list.first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
              {/foreach}
            {else}
              <li>{$aLang.topic_tags_empty}</li>
            {/if}

            {if $oUserCurrent}
              {if $oFavourite}
                {foreach from=$oFavourite->getTagsArray() item=sTag name=tags_list_user}
                  <li class="topic-tags-user js-favourite-tag-user">, <a rel="tag" href="{$oUserCurrent->getUserWebPath()}favourites/topics/tag/{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
                {/foreach}
              {/if}

              <li class="topic-tags-edit js-favourite-tag-edit" {if !$oFavourite}style="display:none;"{/if}>
                <a href="#" onclick="return ls.favourite.showEditTags({$oTopic->getId()},'topic',this);" class="link-dotted">{$aLang.favourite_form_tags_button_show}</a>
              </li>
            {/if}
          {/strip}
        </ul>
      {/if}
    {else}
      {if {cfg name='custom.topic.tags_index'}}
        {include file='custom/topic.tags.tpl'}
      {/if}
    {/if}


    {if !$bTopicList}
      <div class="topic-share" id="topic_share_{$oTopic->getId()}">
        {hookb run="topic_share" topic=$oTopic bTopicList=$bTopicList}
          <div class="ya-share2" data-title="{$oTopic->getTitle()|escape:'html'}" data-url="{$oTopic->getUrl()}" data-lang="ru" data-size="s" data-services="yaru,vkontakte,facebook,twitter,odnoklassniki,moimir,lj,gplus"></div>
        {/hookb}
      </div>
    {/if}


    <ul class="list-unstyled list-inline small topic-info">
      <li class="topic-info-author" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
        <a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="{$oUser->getLogin()}" class="avatar" itemprop="image" /></a>
        <span itemprop="name">
          <a rel="author" href="{$oUser->getUserWebPath()}" itemprop="url">{$oUser->getLogin()}</a>
        </span>
      </li>
      <li class="topic-info-favourite">
        <a href="#" onclick="return ls.favourite.toggle({$oTopic->getId()},this,'topic');" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}" title="{if $oUserCurrent && $oTopic->getIsFavourite()}{$aLang.topic_del_favourite}{else}{$aLang.topic_add_favourite}{/if}"><span class="glyphicon glyphicon-star-empty"></span></a>
        <span class="text-muted favourite-count" id="fav_count_topic_{$oTopic->getId()}">{if $oTopic->getCountFavourite()>0}{$oTopic->getCountFavourite()}{/if}</span>
      </li>
      {if !$bTopicList}
        <li class="topic-info-share"><a href="#" class="glyphicon glyphicon-share-alt" title="{$aLang.topic_share}" onclick="jQuery('#topic_share_{$oTopic->getId()}').slideToggle(); return false;"></a></li>
      {/if}

      {if $bTopicList}
        <li class="topic-info-comments">
          {if $oTopic->getCountCommentNew()}
            <a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}" class="new">
              <span class="glyphicon glyphicon-comment"></span>
              <span>{$oTopic->getCountComment()}</span>
              <span class="count">+{$oTopic->getCountCommentNew()}</span>
            </a>
          {elseif $oTopic->getCountComment()}
            <a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}" class="icon-active">
              <span class="glyphicon glyphicon-comment"></span>
              <span>{$oTopic->getCountComment()}</span>
            </a>
          {else}
            <a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}">
              <span class="glyphicon glyphicon-comment"></span>
              <span>{$oTopic->getCountComment()}</span>
            </a>
          {/if}
        </li>
      {/if}

      {if {cfg name='custom.topic.vote'}}
        <li id="vote_area_topic_{$oTopic->getId()}" class="pull-right vote
                                  {if $oVote || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId()) || strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}
                                    {if $oTopic->getRating() > 0}
                                      vote-count-positive
                                    {elseif $oTopic->getRating() < 0}
                                      vote-count-negative
                                    {/if}
                                  {/if}

                                  {if $oVote}
                                    voted

                                    {if $oVote->getDirection() > 0}
                                      voted-up
                                    {elseif $oVote->getDirection() < 0}
                                      voted-down
                                    {/if}
                                  {/if}">
          {if $oVote || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId()) || strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}
            {assign var="bVoteInfoShow" value=true}
          {/if}
          <div class="vote-down" onclick="return ls.vote.vote({$oTopic->getId()},this,-1,'topic');"><span class="glyphicon glyphicon-thumbs-down"></span></div>
          <div class="vote-count {if $bVoteInfoShow}js-infobox-vote-topic{/if}" id="vote_total_topic_{$oTopic->getId()}" title="{$aLang.topic_vote_count}: {$oTopic->getCountVote()}">
            {if $bVoteInfoShow}
              {if $oTopic->getRating() > 0}+{/if}{$oTopic->getRating()}
            {else}
              <a href="#" onclick="return ls.vote.vote({$oTopic->getId()},this,0,'topic');">?</a>
            {/if}
          </div>
          <div class="vote-up" onclick="return ls.vote.vote({$oTopic->getId()},this,1,'topic');"><span class="glyphicon glyphicon-thumbs-up"></span></div>
          {if $bVoteInfoShow}
            <div id="vote-info-topic-{$oTopic->getId()}" style="display: none;">
              <ul class="list-unstyled vote-topic-info">
                <li><span class="glyphicon glyphicon-thumbs-up"></span>{$oTopic->getCountVoteUp()}</li>
                <li><span class="glyphicon glyphicon-thumbs-down"></span>{$oTopic->getCountVoteDown()}</li>
                <li><span class="glyphicon glyphicon-eye-open"></span>{$oTopic->getCountVoteAbstain()}</li>
                {hook run='topic_show_vote_stats' topic=$oTopic}
              </ul>
            </div>
          {/if}
        </li>
      {/if}

      {hook run='topic_show_info' topic=$oTopic}
    </ul>


    {if !$bTopicList}
      {hook run='topic_show_end' topic=$oTopic}
    {/if}
  </footer>
</article> <!-- /.topic -->
