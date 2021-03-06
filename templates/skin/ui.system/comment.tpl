{assign var="oUser" value=$oComment->getUser()}
{assign var="oVote" value=$oComment->getVote()}

<article id="comment_id_{$oComment->getId()}" class="comment
                          {if $oComment->isBad()}
                            comment-bad
                          {/if}

                          {if $oComment->getDelete()}
                            comment-deleted
                          {elseif $oUserCurrent and $oComment->getUserId() == $oUserCurrent->getId()}
                            comment-self
                          {elseif $sDateReadLast <= $oComment->getDate()}
                            comment-new
                          {/if}

                          {if $oTopic and $oComment->getUserId() == $oTopic->getUserId()}
                            comment-ts
                          {/if}

                          {if $oUser->isAdministrator()}
                            comment-admin
                          {/if}" itemprop="comment" itemscope="" itemtype="http://schema.org/Comment">
  {if !$oComment->getDelete() or $bOneComment or ($oUserCurrent and $oUserCurrent->isAdministrator())}
    <div class="folding"></div>
    <header class="comment-header">
      <a id="comment{$oComment->getId()}"></a>
      <a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="{$oUser->getLogin()}" class="comment-avatar" /></a>

      <ul class="list-unstyled small comment-info">
        <li class="comment-author" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
          <meta itemprop="image" content="{$oUser->getProfileAvatarPath()}" />
          <span itemprop="name">
            <a href="{$oUser->getUserWebPath()}"  {if $iAuthorId == $oUser->getId()}title="{if $sAuthorNotice}{$sAuthorNotice}{/if}" class="comment-topic-author"{/if} itemprop="url">{$oUser->getLogin()}</a>
          </span>
        </li>
        <!-- online-offline status -->
        <li class="{if $oUser->isOnline()}text-success{else}text-danger{/if} comment-author-status">
          <i title="{if $oUser->isOnline()}{$aLang.user_status_online}{else}{$aLang.user_status_offline}{/if}" class="fa fa-power-off"></i>
        </li>
        <!-- / online-offline status -->
        <li class="comment-date">
          <a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}#comment{/if}{$oComment->getId()}" class="link-dotted" title="{$aLang.comment_url_notice}" itemprop="url">
            <time datetime="{date_format date=$oComment->getDate() format='c'}" itemprop="datePublished">
              {date_format date=$oComment->getDate() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
            </time>
          </a>
        </li>

        {if $oComment->getPid()}
          <li class="goto-comment-parent"><a href="#" onclick="ls.comments.goToParentComment({$oComment->getId()},{$oComment->getPid()}); return false;" title="{$aLang.comment_goto_parent}">↑</a></li>
        {/if}
        <li class="goto-comment-child"><a href="#" title="{$aLang.comment_goto_child}">↓</a></li>


        {if $oComment->getTargetType() != 'talk' and {cfg name='custom.comment.vote'}}
          <li id="vote_area_comment_{$oComment->getId()}" class="vote
                                      {if $oComment->getRating() > 0}
                                        vote-count-positive
                                      {elseif $oComment->getRating() < 0}
                                        vote-count-negative
                                      {/if}

                                      {if $oVote}
                                        voted

                                        {if $oVote->getDirection() > 0}
                                          voted-up
                                        {else}
                                          voted-down
                                        {/if}
                                      {/if}">
            <div class="vote-down" onclick="return ls.vote.vote({$oComment->getId()},this,-1,'comment');"><span class="glyphicon glyphicon-thumbs-down"></span></div>
            <span class="vote-count" id="vote_total_comment_{$oComment->getId()}">{if $oComment->getRating() > 0}+{/if}{$oComment->getRating()}</span>
            <div class="vote-up" onclick="return ls.vote.vote({$oComment->getId()},this,1,'comment');"><span class="glyphicon glyphicon-thumbs-up"></span></div>
          </li>
        {/if}


        {if $oUserCurrent and !$bNoCommentFavourites}
          <li class="comment-favourite">
            <a href="#" onclick="return ls.favourite.toggle({$oComment->getId()},this,'comment');" class="favourite {if $oComment->getIsFavourite()}active{/if}" title="{if $oComment->getIsFavourite()}{$aLang.topic_del_favourite}{else}{$aLang.topic_add_favourite}{/if}"><span class="glyphicon glyphicon-star-empty"></span></a>
            <span class="text-muted favourite-count" id="fav_count_comment_{$oComment->getId()}">{if $oComment->getCountFavourite() > 0}{$oComment->getCountFavourite()}{/if}</span>
          </li>
        {/if}
      </ul>
    </header>


    <div id="comment_content_id_{$oComment->getId()}" class="comment-content">
      <div class="text" itemprop="text">
        {$oComment->getText()}
      </div>

      {if $oUserCurrent}
        <ul class="list-unstyled list-inline small comment-actions">
          {if !$oComment->getDelete() and !$bAllowNewComment}
            <li><a title="{$aLang.comment_answer}" href="#" onclick="ls.comments.toggleCommentForm({$oComment->getId()}); return false;" class="reply-link"><i class="fa fa-reply fa-fw"></i></a></li>
          {/if}

          {if !$oComment->getDelete() and $oUserCurrent and $oUserCurrent->isAdministrator()}
            <li><a title="{$aLang.comment_delete}" href="#" class="comment-delete" onclick="ls.comments.toggle(this,{$oComment->getId()}); return false;"><i class="fa fa-trash-o fa-fw"></i></a></li>
          {/if}

          {if $oComment->getDelete() and $oUserCurrent and $oUserCurrent->isAdministrator()}
            <li><a title="{$aLang.comment_repair}" href="#" class="comment-repair" onclick="ls.comments.toggle(this,{$oComment->getId()}); return false;"><i class="fa fa-repeat fa-fw"></i></a></li>
          {/if}

          {hook run='comment_action' comment=$oComment}
        </ul>
      {/if}
    </div>
  {else}
    <span class="text-muted">{$aLang.comment_was_delete}</span>
  {/if}
</article>
