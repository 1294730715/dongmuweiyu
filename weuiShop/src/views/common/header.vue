<template lang="html">
  <div class="weui-navbar">
    <div class="weui-bar__item_on weui-left ">
        <a href="#"><</a>
    </div>
    <div class="weui-flex__item">
      <div class="weui-search-bar" id="searchBar">
          <form class="weui-search-bar__form">
              <div class="weui-search-bar__box">
                  <i class="weui-icon-search"></i>
                  <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required="">
                  <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
              </div>
              <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
                  <i class="weui-icon-search"></i>
                  <span>搜索</span>
              </label>
          </form>
          <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
      </div>
    </div>
    <div class="three">
        选项三
    </div>
</div>
</template>

<script>
export default {
  data () {
    return {}
  },
  computed: {},
  ready () {},
  attached () {},
  methods: {},
  components: {}
}
</script>

<style lang="css">
.weui-left{
  width: 30px;
  margin-top: 5px;
}
.three{
  margin-top: 10px;

}
</style>
