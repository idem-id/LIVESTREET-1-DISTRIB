<ul class="list-unstyled poll-result" id="poll-result-original-{$oTopic->getId()}">
  {foreach from=$oTopic->getQuestionAnswers() key=key item=aAnswer}
    <li {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}class="most"{/if}>
      {$aAnswer.text|escape:'html'} <span class="text-muted">({$aAnswer.count})</span>
      <span class="pull-right text-muted">{$oTopic->getQuestionAnswerPercent($key)}%</span>
      <div class="progress">
        <div class="progress-bar {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}progress-bar-success{else}progress-bar-info{/if}" style="width: {$oTopic->getQuestionAnswerPercent($key)}%;"></div>
      </div>
    </li>
  {/foreach}
</ul>


<ul class="list-unstyled poll-result" id="poll-result-sort-{$oTopic->getId()}" style="display: none;">
  {foreach from=$oTopic->getQuestionAnswers(true) key=key item=aAnswer}
    <li {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}class="most"{/if}>
      {$aAnswer.text|escape:'html'} <span class="text-muted">({$aAnswer.count})</span>
      <span class="pull-right text-muted">{$oTopic->getQuestionAnswerPercent($key)}%</span>
      <div class="progress">
        <div class="progress-bar {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}progress-bar-success{else}progress-bar-info{/if}" style="width: {$oTopic->getQuestionAnswerPercent($key)}%;"></div>
      </div>
    </li>
  {/foreach}
</ul>

<button type="submit" class="btn btn-default btn-sm" title="{$aLang.topic_question_vote_result_sort}" onclick="return ls.poll.switchResult(this, {$oTopic->getId()});"><span class="glyphicon glyphicon-align-left"></span></button>

<span class="text-muted small pull-right poll-total poll-total-result">{$aLang.topic_question_vote_result}: {$oTopic->getQuestionCountVote()} | {$aLang.topic_question_abstain_result}: {$oTopic->getQuestionCountVoteAbstain()}</span>
