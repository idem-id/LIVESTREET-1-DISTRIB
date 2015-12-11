{hook run='people_sidebar_begin'}

{insert name="block" block='tagsCity'}
{insert name="block" block='tagsCountry'}

{if {cfg name='custom.block.stats'}}
  <section class="panel panel-default block">
    <div class="panel-body">

      <header class="block-header">
        <h3>{$aLang.user_stats_main}</h3>
      </header>

      <div class="block-content">
        <ul class="list-unstyled item-list">
          <li class="clearfix">
            <div class="text-muted pull-left">{$aLang.user_stats_all}:</div>
            <div class="pull-right">{$aStat.count_all}</div>
          </li>
          <li class="clearfix">
            <div class="text-muted pull-left">{$aLang.user_stats_active}:</div>
            <div class="pull-right">{$aStat.count_active}</div>
          </li>
          <li class="clearfix">
            <div class="text-muted pull-left">{$aLang.user_stats_noactive}:</div>
            <div class="pull-right">{$aStat.count_inactive}</div>
          </li>
        </ul>
      </div>

    </div>
  </section>

  <section class="panel panel-default block">
    <div class="panel-body">

      <header class="block-header">
        <h3>{$aLang.user_stats_gender}</h3>
      </header>

      <div class="block-content">
        <ul class="list-unstyled item-list">
          <li class="clearfix">
            <div class="text-muted pull-left">{$aLang.user_stats_sex_man}:</div>
            <div class="pull-right">{$aStat.count_sex_man}</div>
          </li>
          <li class="clearfix">
            <div class="text-muted pull-left">{$aLang.user_stats_sex_woman}:</div>
            <div class="pull-right">{$aStat.count_sex_woman}</div>
          </li>
          <li class="clearfix">
            <div class="text-muted pull-left">{$aLang.user_stats_sex_other}:</div>
            <div class="pull-right">{$aStat.count_sex_other}</div>
          </li>
        </ul>
      </div>

    </div>
  </section>
{/if}

{hook run='people_sidebar_end'}
