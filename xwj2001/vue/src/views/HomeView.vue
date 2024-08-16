<template>
    <div class="common-layout" style="margin-top: -5px">
      <el-container>
        <el-header style="min-height: 65px; margin-top: 20px">
          <el-row :gutter="15">
            <el-col :span="4">
              <el-card shadow="hover">商品总数：{{ this.Count.ccount }}</el-card>
            </el-col>
            <el-col :span="4">
              <el-card shadow="hover">商品标签总数：{{ this.Count.ctcount }}</el-card>
            </el-col>
            <el-col :span="4">
              <el-card shadow="hover">商品类型总数：{{ this.Count.ctycount }}</el-card>
            </el-col>
            <el-col :span="4">
              <el-card shadow="hover">商品款式总数：{{ this.Count.cscount }}</el-card>
            </el-col>
            <el-col :span="4">
              <el-card shadow="hover">活动总数：{{ this.Count.acount }}</el-card>
            </el-col>
            <el-col :span="4">
              <el-card shadow="hover">用户总数：{{ this.Count.ucount }}</el-card>
            </el-col>
          </el-row>
        </el-header>
        <el-main>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-card shadow="hover">
                <div id="type" style="margin-top: 20px"></div>
              </el-card>
            </el-col>
          </el-row>
          <div style="margin-top: 10px">
            <el-row :gutter="20">
              <el-col :span="12">
                <el-card shadow="hover">
                  <div id="style" style="width: 720px ;margin-top: 20px"></div>
                </el-card>
              </el-col>
              <el-col :span="12">
                <el-card shadow="hover">
                  <div id="tag" style="margin-top: 20px"></div>
                </el-card>
              </el-col>
            </el-row>
          </div>
        </el-main>
      </el-container>
    </div>
</template>
<script>
import home from '@/api/HomeApi.js'
import * as echarts from "echarts";
import {toRaw} from "vue";


export default {
  mounted() {
    this.typeInit()
    this.styleInit()
    this.tagInit()
  },
  data: function () {
    return {
      Count: [],
    }
  },
  created() {
    // this.init()
    this.loadC()
  },
  methods: {
    //初始化函数
    tagInit() {
      // 基于准备好的dom，初始化echarts实例
      let Chart = echarts.init(document.getElementById("tag"));
      let tagTotals = []
      // 绘制图表
      home.getTagTotal().then((response) => {
        // console.log(response.data)
        for (let i = 0; i < (response.data).length; i++) {
          let tagTotal = {}
          tagTotal.value = response.data[i].commodityCount
          tagTotal.name = response.data[i].commodityTagName
          // console.log(styleTotal)
          tagTotals.push(tagTotal)
        }
        // console.log(styleTotals)
        // 绘制图表
        Chart.setOption({
          title: {
            text: "商品标签总汇",
          },
          tooltip: {
            trigger: 'item'
          },
          legend: {
            top: '91%',
            left: 'center'
          },
          series: [
            {
              name: '标签',
              type: 'pie',
              radius: ['40%', '70%'],
              avoidLabelOverlap: false,
              itemStyle: {
                borderRadius: 10,
                borderColor: '#fff',
                borderWidth: 2
              },
              label: {
                show: false,
                position: 'center'
              },
              emphasis: {
                label: {
                  show: true,
                  fontSize: 40,
                  fontWeight: 'bold'
                }
              },
              labelLine: {
                show: false
              },
              data: tagTotals
            }
          ]
        });
      });
    },
    //初始化函数
    styleInit() {
      // 基于准备好的dom，初始化echarts实例
      let Chart = echarts.init(document.getElementById("style"));
      let styleTotals = []
      home.getStyleTotal().then((response) => {
        // console.log(response.data)
        for (let i = 0; i < (response.data).length; i++) {
          let styleTotal = {}
          styleTotal.value = response.data[i].commodityCount
          styleTotal.name = response.data[i].commodityStyleName
          // console.log(styleTotal)
          styleTotals.push(styleTotal)
        }
        // console.log(styleTotals)
        // 绘制图表
        Chart.setOption({
          title: {
            text: "商品款式总汇",
          },
          tooltip: {
            trigger: 'item'
          },
          legend: {
            top: '86%',
            left: 'left'
          },
          series: [
            {
              name: '款式',
              type: 'pie',
              radius: ['40%', '70%'],
              avoidLabelOverlap: false,
              itemStyle: {
                borderRadius: 10,
                borderColor: '#fff',
                borderWidth: 2
              },
              label: {
                show: false,
                position: 'center'
              },
              emphasis: {
                label: {
                  show: true,
                  fontSize: 40,
                  fontWeight: 'bold'
                }
              },
              labelLine: {
                show: false
              },
              data: styleTotals
            }
          ]
        });
      });
    },
    //初始化函数
    typeInit() {
      // 基于准备好的dom，初始化echarts实例
      let Chart = echarts.init(document.getElementById("type"));
      let typeTotalName = []
      let typeTotalCount = []
      // 绘制图表
      home.getTypeTotal().then((response) => {
        // console.log(response.data)
        for (let i = 0; i < (response.data).length; i++) {
          typeTotalName.push(toRaw(response.data[i].commodityTypeName))
          typeTotalCount.push(toRaw(response.data[i].commodityCount))
        }
        Chart.setOption({
          title: {
            text: '商品品类总汇'
          },
          tooltip: {},
          legend: {},
          xAxis: {
            data: typeTotalName
          },
          yAxis: {},
          series: [
            {
              name: '数量',
              type: 'bar',
              data: typeTotalCount
            }
          ]
        });
      });
    },
    loadC() {
      home.getcCount().then((response) => {
        this.Count.ccount = response.data[0].ccount
      }).catch((err) => {
        console.log(err);
      })
      // console.log(this.Count)

      home.getaCount().then((response) => {
        this.Count.acount = response.data[0].acount
        // console.log(response.data)
      }).catch((err) => {
        console.log(err);
      })

      home.getcsCount().then((response) => {
        this.Count.cscount = response.data[0].csCount
        // console.log(response.data)
      }).catch((err) => {
        console.log(err);
      })

      home.getuCount().then((response) => {
        this.Count.ucount = response.data[0].ucount
        // console.log(response.data)
      }).catch((err) => {
        console.log(err);
      })

      home.getctCount().then((response) => {
        this.Count.ctcount = response.data[0].ctCount
        // console.log(response.data)
      }).catch((err) => {
        console.log(err);
      })

      home.getctyCount().then((response) => {
        this.Count.ctycount = response.data[0].ctyCount
        // console.log(response.data)
      }).catch((err) => {
        console.log(err);
      })

      // console.log(this.Count)
    }
  }
}
</script>
<style>
#type {
  width: 100vw;
  height: 50vh;
}

#style {
  width: 50vw;
  height: 50vh;
}

#tag {
  width: 50vw;
  height: 50vh;
}
</style>