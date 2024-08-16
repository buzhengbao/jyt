<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="12">
          <el-col :span="12">
            <el-button plain @click="openAdd">
              新增订单
            </el-button>
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
        <el-table :data="tableData" Type="height:440px; width: 100%">
          <el-table-column width="80" prop="orderId" label="订单ID"/>
          <el-table-column prop="orderNum" label="订单号"/>
          <el-table-column width="80" prop="userName" label="执行人"/>
          <el-table-column prop="commodityName" label="商品名"/>
          <el-table-column width="80" prop="client" label="客户"/>
          <el-table-column prop="tel" label="联系方式"/>
          <el-table-column prop="commodityPrice" label="单价"/>
          <el-table-column width="80" prop="num" label="数量"/>
          <el-table-column width="80" prop="stateName" label="订单状态"/>
          <el-table-column prop="addTime" label="添加时间"/>
          <el-table-column label="操作" width="200" v-slot="scope">
            <el-button plain @click="openUpdate(scope.row)">
              修改
            </el-button>
            <el-popconfirm :title='"你确定要删除&emsp;" + "<" + scope.row.orderNum + ">" + "?"'
                           @confirm='OrderDel(scope.row.orderId)'>
              <template #reference>
                <el-button>删除</el-button>
              </template>
            </el-popconfirm>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </div>
  <el-dialog v-model="dialogFormVisible" title="修改订单" width="500">
    <el-form :model="form">
      <el-form-item label="&emsp;订单ID">
        <el-input disabled v-model="form.orderId" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="&emsp;订单号">
        <el-input disabled v-model="form.orderNum" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="执行人ID">
        <el-input v-model="form.userId" placeholder="请输入执行人ID" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="&emsp;商品ID">
        <el-input v-model="form.commodityId" placeholder="请输入商品ID" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="&emsp;客户名">
        <el-input v-model="form.client" placeholder="请输入客户名" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="联系方式">
        <el-input v-model="form.tel" placeholder="请输入联系方式" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="&emsp;&emsp;数量">
        <el-input v-model="form.num" placeholder="请输入数量" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="&emsp;&emsp;状态">
        <el-select v-model="zt" filterable placeholder="选择状态" style="width: 240px">
          <el-option v-for="item in state" :key="item.value" :label="item.label"
                     :value="item.value"
          ></el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="updateOrder(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
  <el-dialog v-model="dialogFormVisible1" title="新增订单" width="500">
    <el-form :model="form">
      <el-form-item label="执行人ID">
        <el-input v-model="form.userId" placeholder="请输入执行人ID" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="&emsp;商品ID">
        <el-input v-model="form.commodityId" placeholder="请输入商品ID" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="&emsp;客户名">
        <el-input v-model="form.client" placeholder="请输入客户名" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="联系方式">
        <el-input v-model="form.tel" placeholder="请输入联系方式" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="&emsp;&emsp;数量">
        <el-input v-model="form.num" placeholder="请输入数量" autocomplete="off"/>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="addOrder(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>


<script>
import axios from "axios";
import Order from "@/api/OrderApi.js";
import {ElMessage} from "element-plus";

export default {
  el: '#app',
  data: function () {
    return {
      zt: '',
      state:[
        {
          value: '1',
          label: '已完成',
        },
        {
          value: '2',
          label: '未完成',
        }
      ],
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
      Order.query(info,this.selectTime).then(res => {
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
    updateOrder(info){
      // console.log(info)
      // console.log(this.imgUrl)
      Order.update(info.orderId,info.userId,info.commodityId,info.client,info.tel,info.num,this.zt).then(res => {
        if (res.code == 200){
          ElMessage({
            message: '更新成功',
            type: 'success',
          })
          this.loadOrder();
        }
        else {
          ElMessage.error('更新失败')
          this.loadOrder();
        }
      });
      this.form = []
      this.imgUrl = ''
      this.dialogFormVisible = false
      this.zt = ''
    },
    openUpdate(info){
      this.selectTime = ''
      this.dialogFormVisible = true
      // console.log(info)
      this.form.orderNum = info.orderNum
      this.form.orderId = info.orderId
    },
    OrderDel(id){
      // console.log(id)
      Order.delete(id).then(res => {
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
    openAdd(){
      this.selectTime = ''
      this.value = ''
      this.form = []
      this.dialogFormVisible1 = true
    },
    loadOrder(){
      Order.getALL().then((response) => {
        // console.log(response.data)
        this.tableData = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
    addOrder(info){
      // console.log(this.selectTime[0])
      // console.log(info)
      const orderNum = 'DDU' + info.userId + Math.floor(Math.random() * 10000000)
      // console.log(orderNum)
      // console.log(this.nowTime)
      // console.log(this.imgUrl)
      Order.add(orderNum,info.userId,info.commodityId,info.client,info.tel,info.num, this.nowTime).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '添加成功',
            type: 'success',
          })
          this.loadOrder();
        } else {
          ElMessage.error('添加失败')
          this.loadOrder();
        }
      });
      this.dialogFormVisible1 = false
      this.imgUrl = ''
      this.form = []
      this.selectTime = ''
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