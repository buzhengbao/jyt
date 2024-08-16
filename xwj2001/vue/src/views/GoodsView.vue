<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="12">
          <el-col :span="12">
            <el-button plain @click="openAdd">
              新增商品
            </el-button>
          </el-col>
          <el-col :span="12">
            <el-form :model="form" @submit.native.prevent>
              <el-form-item>
                <el-row :gutter="10">
                  <el-col :span="14">
                    <el-input placeholder="请输入款号或者名称" v-model="form.commodityName" autocomplete="off"/>
                  </el-col>
                  <el-col :span="5">
                    <el-button type="danger" @click="clean">清空</el-button>
                  </el-col>
                  <el-col :span="5">
                    <el-button type="primary" @click="queryCommodity(form.commodityName)">Query</el-button>
                  </el-col>
                </el-row>
              </el-form-item>
            </el-form>
          </el-col>
        </el-row>
        <hr/>
      </el-header>
      <el-main>
        <el-row>
          <el-col :span="24">
            <el-form-item label="款式:" prop="">
              <el-radio-group v-model="ks">
                <el-radio :label="item.commodityStyleName" :key="item.commodityStyleId" v-for="item in style"
                          @change="queryCommodityByStyle(item.commodityStyleId)">
                  {{ item.commodityStyleName }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="类型:" prop="">
              <el-radio-group v-model="lx">
                <el-radio :label="item.commodityTypeName" :key="item.commodityTypeId" v-for="item in type"
                          @change="queryCommodityByType(item.commodityTypeId)">
                  {{ item.commodityTypeName }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="活动:" prop="">
              <el-radio-group v-model="hd">
                <el-radio :label="item.activityName" :key="item.activityId" v-for="item in activity"
                          @change="queryCommodityByActivity(item.activityId)">
                  {{ item.activityName }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <hr/>
        <el-table :data="tableData" style="width: 100%; height: 500px">
          <el-table-column prop="commodityId" width="50px" label="ID"/>
          <el-table-column prop="commodityNum" label="款号"/>
          <el-table-column prop="commodityName" width="300px" label="名称"/>
          <el-table-column label="照片" v-slot="Style">
            <el-image :src="Style.row.commodityUrl"></el-image>
          </el-table-column>
          <el-table-column prop="commodityPrice" width="100px" label="价格(元)"/>
          <el-table-column prop="commodityFineness" width="60px" label="成色"/>
          <el-table-column prop="commodityWeight" label="质量(g)"/>
          <el-table-column prop="commodityInventory" width="60px" label="库存"/>
          <el-table-column prop="commodityWage" width="100px" label="工费(g/元)"/>
          <el-table-column prop="commodityTypeName" label="类型"/>
          <el-table-column prop="commodityStyleName" label="款式"/>
          <el-table-column prop="activityName" label="活动"/>
          <el-table-column prop="commodityAddTime" label="添加时间" width="110px"/>
          <el-table-column label="操作" width="180" v-slot="scope">
            <el-button plain @click="openUpdate(scope.row)">
              修改
            </el-button>
            <el-popconfirm :title='"你确定要删除&emsp;" + "<" + scope.row.commodityName + ">" + "?"'
                           @confirm='CommodityDel(scope.row.commodityId)'>
              <template #reference>
                <el-button>删除</el-button>
              </template>
            </el-popconfirm>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </div>
  <el-dialog v-model="dialogFormVisible" title="修改商品" width="500">
    <el-form :model="form">
      <el-form-item label="款&emsp;&emsp;号">
        <el-input v-model="form.commodityNum" placeholder="请输入款号" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品名称">
        <el-input v-model="form.commodityName" placeholder="请输入商品名称" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品价格">
        <el-input v-model="form.commodityPrice" placeholder="请输入商品价格" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品成色">
        <el-input v-model="form.commodityFineness" placeholder="请输入商品成色" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品质量">
        <el-input v-model="form.commodityWeight" placeholder="请输入商品质量" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品库存">
        <el-input v-model="form.commodityInventory" placeholder="请输入商品库存" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品工费">
        <el-input v-model="form.commodityWage" placeholder="请输入商品工费" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="类&emsp;&emsp;型">
        <el-select v-model="lx" filterable placeholder="选择类型" style="width: 240px">
          <el-option v-for="item in type" :key="item.commodityTypeId" :label="item.commodityTypeName"
                     :value="item.commodityTypeId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="款&emsp;&emsp;式">
        <el-select v-model="ks" filterable placeholder="选择款式" style="width: 240px">
          <el-option v-for="item in style" :key="item.commodityStyleId" :label="item.commodityStyleName"
                     :value="item.commodityStyleId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="活&emsp;&emsp;动">
        <el-select v-model="hd" filterable placeholder="选择活动" style="width: 240px">
          <el-option v-for="item in activity" :key="item.activityId" :label="item.activityName" :value="item.activityId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="图片">
        <input type="file" @change="getFile($event)">
        <el-button @click="post()" v-loading.fullscreen.lock="fullscreenLoading">确认上传</el-button>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="updateCommodity(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
  <el-dialog v-model="dialogFormVisible1" title="新增商品" width="500">
    <el-form :model="form">
      <el-form-item label="款&emsp;&emsp;号">
        <el-input v-model="form.commodityNum" placeholder="请输入商品款号" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品名称">
        <el-input v-model="form.commodityName" placeholder="请输入商品名称" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品价格">
        <el-input v-model="form.commodityPrice" placeholder="请输入商品价格" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品成色">
        <el-input v-model="form.commodityFineness" placeholder="请输入商品成色" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品质量">
        <el-input v-model="form.commodityWeight" placeholder="请输入商品质量" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品库存">
        <el-input v-model="form.commodityInventory" placeholder="请输入商品库存" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="商品工费">
        <el-input v-model="form.commodityWage" placeholder="请输入商品工费" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="类&emsp;&emsp;型">
        <el-select v-model="lx" filterable placeholder="选择类型" style="width: 240px">
          <el-option v-for="item in type" :key="item.commodityTypeId" :label="item.commodityTypeName"
                     :value="item.commodityTypeId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="款&emsp;&emsp;式">
        <el-select v-model="ks" filterable placeholder="选择款式" style="width: 240px">
          <el-option v-for="item in style" :key="item.commodityStyleId" :label="item.commodityStyleName"
                     :value="item.commodityStyleId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="活&emsp;&emsp;动">
        <el-select v-model="hd" filterable placeholder="选择活动" style="width: 240px">
          <el-option v-for="item in activity" :key="item.activityId" :label="item.activityName" :value="item.activityId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="图片">
        <input type="file" @change="getFile($event)">
        <el-button @click="post()" v-loading.fullscreen.lock="fullscreenLoading">确认上传</el-button>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="addCommodity(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>
<script>
import commodity from "@/api/CommodityApi.js";
import type from "@/api/TypeApi.js";
import style from "@/api/StyleApi.js";
import tag from "@/api/TagApi.js";
import activity from "@/api/ActivityApi.js";
import {ElMessage} from "element-plus";
import axios from "axios";

export default {
  data: function () {
    return {
      nowTime: '',
      ks: '',
      hd: '',
      lx: '',
      value: '',
      activity: [],
      type: [],
      style: [],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      form: [],
      tableData: [],
      imgUrl: '',
      fullscreenLoading: false,
    }
  },
  created() {
    this.getTimes()
    this.loadCommodity();
    this.loadCommodityType();
    this.loadCommodityStyle();
    this.loadActivity();
  },
  methods: {
    queryCommodityByStyle(info) {
      // console.log(info)
      commodity.queryByStyle(info).then(res => {
        if (res.code == 200) {
          // console.log(res.data)
          this.tableData = res.data
          ElMessage({
            message: '查询成功',
            type: 'success',
          })
        } else {
          ElMessage.error('查询失败')
        }
      });
      this.imgUrl = ''
      this.lx = ''
      this.hd = ''
    },
    queryCommodityByType(info) {
      console.log(info)
      commodity.queryByType(info).then(res => {
        if (res.code == 200) {
          // console.log(res.data)
          this.tableData = res.data
          ElMessage({
            message: '查询成功',
            type: 'success',
          })
        } else {
          ElMessage.error('查询失败')
        }
      });
      this.ks = ''
      this.hd = ''
    },
    queryCommodityByActivity(info) {
      console.log(info)
      commodity.queryByActivity(info).then(res => {
        if (res.code == 200) {
          // console.log(res.data)
          this.tableData = res.data
          ElMessage({
            message: '查询成功',
            type: 'success',
          })
        } else {
          ElMessage.error('查询失败')
        }
      });
      this.ks = ''
      this.lx = ''
    },
    queryCommodity(info) {
      console.log(info)
      commodity.queryByNum(info).then(res => {
        if (res.code == 200) {
          // console.log(res.data)
          this.tableData = res.data
          ElMessage({
            message: '查询成功',
            type: 'success',
          })
        } else {
          ElMessage.error('查询失败')
        }
      });
      this.imgUrl = ''
      this.ks = ''
      this.lx = ''
      this.hd = ''
    },
    clean() {
      this.value = ''
      this.form = []
      this.loadCommodity()
      this.ks = ''
      this.lx = ''
      this.hd = ''
    },
    openAdd() {
      this.value = ''
      this.form = []
      this.dialogFormVisible1 = true
    },
    addCommodity(info) {
      // console.log(info)
      // console.log(this.ks)
      // console.log(this.lx)
      // console.log(this.bq)
      // console.log(this.hd)
      commodity.add(info.commodityNum, info.commodityName, this.imgUrl, info.commodityPrice, info.commodityFineness, info.commodityWeight, info.commodityInventory, info.commodityWage
          ,this.bq, this.lx, this.ks, this.hd, this.nowTime).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '添加成功',
            type: 'success',
          })
          this.loadCommodity();
        } else {
          ElMessage.error('添加失败')
          this.loadCommodity();
        }
      });
      this.imgUrl = ''
      this.dialogFormVisible1 = false
      this.value = ''
      this.form = []
      this.ks = ''
      this.lx = ''
      this.hd = ''
    },
    CommodityDel(CommodityId) {
      // console.log(CommodityId)
      commodity.delete(CommodityId).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '删除成功',
            type: 'success',
          })
          this.loadCommodity();
        } else {
          ElMessage.error('删除失败')
          this.loadCommodity();
        }
      });
    },
    updateCommodity(info) {
      this.dialogFormVisible = false
      // console.log(info)
      // console.log(this.ks)
      // console.log(this.lx)
      // console.log(this.bq)
      // console.log(this.hd)
      commodity.update(info.commodityId, info.commodityNum, info.commodityName,this.imgUrl,  info.commodityPrice, info.commodityFineness, info.commodityWeight, info.commodityInventory, info.commodityWage, this.bq, this.lx, this.ks, this.hd).then(res => {
        if (res.code == 200) {
          this.loadCommodity();
          ElMessage({
            message: '更新成功',
            type: 'success',
          })
        } else {
          ElMessage.error('更新失败')
          this.loadCommodity();
        }
      });
      this.imgUrl = ''
      this.value = ''
      this.form = []
      this.ks = ''
      this.lx = ''
      this.hd = ''
    },
    openUpdate(num) {
      this.imgUrl = ''
      console.log(num)
      this.form = []
      this.dialogFormVisible = true
      this.form = num
      this.lx = num.commodityTypeId
      this.ks = num.commodityStyleId
      this.hd = num.activityId
      // console.log(this.form)
    },
    loadCommodity() {
      commodity.getALL().then((response) => {
        this.tableData = response.data
        console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
    loadCommodityType() {
      type.getALL().then((response) => {
        this.type = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
    loadCommodityStyle() {
      style.getALL().then((response) => {
        this.style = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
    loadActivity() {
      activity.getALL().then((response) => {
        this.activity = response.data
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
    },
    getFile(event) {
      this.videoFile = event.currentTarget.files[0];
    },
    post() {
      let params = new FormData()
      params.append('file', this.videoFile)
      // console.log(params)
      this.fullscreenLoading = true
      axios.post('https://picui.cn/api/v1/upload', params,
          {
            headers: {
              'Content-Type': 'multipart/form-data'
            }
          }).then(res => {
            // console.log(res)
        if (res.status == 200) {
          // console.log(res.data.data.links.url)
          this.imgUrl = res.data.data.links.url
          this.fullscreenLoading = false
          ElMessage({
            message: '上传成功',
            type: 'success',
          })
        } else {
          this.fullscreenLoading = false
          ElMessage.error('上传失败')
        }
      });
    },
  },

}
</script>

<style>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}

.el-tabs--right .el-tabs__content,
.el-tabs--left .el-tabs__content {
  height: 100%;
}

.el-tag {
  aspect-ratio: 1;
}

</style>