<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="12">
          <el-col :span="12">

          </el-col>
          <el-col :span="12">
            <el-form :model="form" @submit.native.prevent>
              <el-form-item>
                <el-row :gutter="10">
                  <el-col :span="9">
                    <div class="block">
                      <el-date-picker
                          v-model="selectTime"
                          type="date"
                          placeholder="Pick a day"
                          size="default"
                          style="max-width: 200px"
                          format="YYYY-MM-DD"
                          value-format="YYYY-MM-DD"
                      />
                    </div>
                  </el-col>
                  <el-col :span="9">
                    <el-input placeholder="请输入名称" v-model="form.OrderName" autocomplete="off"/>
                  </el-col>
                  <el-col :span="3">
                    <el-button type="danger" @click="clean">清空</el-button>
                  </el-col>
                  <el-col :span="3">
                    <el-button type="primary" @click="queryOrder(form.OrderName)">Query</el-button>
                  </el-col>
                </el-row>
              </el-form-item>
            </el-form>
          </el-col>
        </el-row>
        <hr/>
      </el-header>
      <el-main>
        <hr/>
        <el-table :data="tableData" style="height: 450px" Type="height:440px; width: 100%">
          <el-table-column prop="name" label="操作内容"/>
          <el-table-column prop="time" label="操作时间"/>
          <el-table-column prop="userName" label="执行人"/>
          <el-table-column prop="ip" label="ip"/>
          <el-table-column label="操作" width="200" v-slot="scope">
            <el-popconfirm :title='"你确定要删除&emsp;" + "<" + scope.row.name + ">" + "?"'
                           @confirm='OrderDel(scope.row.id)'>
              <template #reference>
                <el-button>删除</el-button>
              </template>
            </el-popconfirm>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </div>
</template>


<script>
import axios from "axios";
import log from "@/api/LogApi.js";
import {ElMessage} from "element-plus";

export default {
  el: '#app',
  data: function () {
    return {
      selectTime: '',
      OrderBeginTime: '',
      OrderEndTime: '',
      fullscreenLoading: false,
      nowTime: '',
      value: '',
      options: [],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      form: [],
      tableData: [],
      videoFile: '',
      title: '',
      username: '',
      imgUrl: '',
    }
  },
  created() {
    this.getTimes()
    this.loadOrder()
  },
  methods: {
    queryOrder(info){
      console.log(info)
      log.query(info,this.selectTime).then(res => {
        if (res.code == 200) {
          this.tableData = res.data
          ElMessage({
            message: '查询成功',
            type: 'success',
          })
        } else {
          ElMessage.error('查询失败')
        }
      });
    },
    clean(){
      this.value = ''
      this.form = []
      this.loadOrder()
      this.selectTime = ''
    },
    OrderDel(id){
      // console.log(id)
      log.delete(id).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '删除成功',
            type: 'success',
          })
          this.loadOrder();
        } else {
          ElMessage.error('删除失败')
          this.loadOrder();
        }
      });
    },
    loadOrder(){
      log.getALL().then((response) => {
        // console.log(response.data)
        this.tableData = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
    getTimes() {
      setInterval(this.getTimesInterval, 1000);
    },
    getTimesInterval: function () {
      let _this = this;
      let year = new Date().getFullYear(); //获取当前时间的年份
      let month = new Date().getMonth() + 1; //获取当前时间的月份
      let day = new Date().getDate(); //获取当前时间的天数
      let hours = new Date().getHours(); //获取当前时间的小时
      let minutes = new Date().getMinutes(); //获取当前时间的分数
      let seconds = new Date().getSeconds(); //获取当前时间的秒数
      //当小于 10 的是时候，在前面加 0
      if (day < 10) {
        day = "0" + day;
      }
      if (month < 10) {
        month = "0" + month;
      }
      if (hours < 10) {
        hours = "0" + hours;
      }
      if (minutes < 10) {
        minutes = "0" + minutes;
      }
      if (seconds < 10) {
        seconds = "0" + seconds;
      }
      //拼接格式化当前时间
      _this.nowTime = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
    }
  }
}

</script>