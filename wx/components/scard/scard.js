// components/popwin/popwin.js
Component({
  properties: {
    sortAscending: {
      type: Boolean,
      value: true // 默认为升序
    },
    sortTarget: {
      type: String,
      value: '默认排序' // 默认升降序的目标名称
    }
  },
  methods: {
    toggleSort() {
      this.setData({
        sortAscending: !this.data.sortAscending
      });
      const sortEventDetail = { 
        ascending: this.data.sortAscending,
        target: this.data.sortTarget // 将排序目标名称一起传递
      };
      this.triggerEvent('sortchange', sortEventDetail); // 触发排序改变事件
    }
  }
})

