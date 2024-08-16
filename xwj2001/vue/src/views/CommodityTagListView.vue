<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="12">
          <el-col :span="12">
            <el-button plain @click="openAdd">
              新增商品标签
            </el-button>
          </el-col>
          <el-col :span="12">
            <el-form :model="form" @submit.native.prevent>
              <el-form-item>
                <el-row :gutter="10">
                  <el-col :span="14">
                    <el-select v-model="tagName" filterable placeholder="选择商品" style="width: 200px">
                      <el-option v-for="item in Commodity" :key="item.commodityId" :label="item.commodityName"
                                 :value="item.commodityName"
                      ></el-option>
                    </el-select>
                  </el-col>
                  <el-col :span="5">
                    <el-button type="danger" @click="clean">清空</el-button>
                  </el-col>
                  <el-col :span="5">
                    <el-button type="primary" @click="queryTag(this.tagName)">Query</el-button>
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
        <el-table :data="tableData" style="height:440px; width: 100%">
          <el-table-column prop="commodityTagId" label="商品标签ID"/>
          <el-table-column prop="commodityName" label="商品名称"/>
          <el-table-column label="商品标签" v-slot="tag">
            <el-tag effect="plain" :type="tag.row.commodityTagColor">{{ tag.row.commodityTagName }}</el-tag>
          </el-table-column>
          <el-table-column label="操作" width="200" v-slot="scope">
            <el-button plain @click="openUpdate(scope.row)">
              修改
            </el-button>
            <el-popconfirm :title='"你确定要删除&emsp;" + "<" + scope.row.commodityName + ">" + "?"'
                           @confirm='TagDel(scope.row.commodityTagListId)'>
              <template #reference>
                <el-button>删除</el-button>
              </template>
            </el-popconfirm>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </div>
  <el-dialog v-model="dialogFormVisible" title="修改商品标签" width="500">
    <el-form :model="form">
      <el-form-item label="商品名称" >
        <el-select v-model="tagName" filterable placeholder="选择商品" style="width: 240px">
          <el-option v-for="item in Commodity" :key="item.commodityId" :label="item.commodityName"
                     :value="item.commodityId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="标签样式">
        <el-select v-model="value" placeholder="选择商品标签" style="width: 200px">
          <el-option v-for="item in Tag" :key="item.commodityTagId" :label="item.commodityTagName" :value="item.commodityTagId">
            <div class="flex items-center">
              <el-tag :type="item.commodityTagColor" style="margin-right: 8px"></el-tag>
              <span :style="{ color: item.commodityTagColor }">{{ item.commodityTagName }}</span>
            </div>
          </el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="updateTag(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
  <el-dialog v-model="dialogFormVisible1" title="新增商品标签" width="500">
    <el-form :model="form">
      <el-form-item label="商品名称">
        <el-select v-model="tagName" filterable placeholder="选择商品" style="width: 240px">
          <el-option v-for="item in Commodity" :key="item.commodityId" :label="item.commodityName"
                     :value="item.commodityId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="标签样式">
        <el-select v-model="value" placeholder="选择商品标签" style="width: 200px">
          <el-option v-for="item in Tag" :key="item.commodityTagId" :label="item.commodityTagName" :value="item.commodityTagId">
            <div class="flex items-center">
              <el-tag :type="item.commodityTagColor" style="margin-right: 8px"></el-tag>
              <span :style="{ color: item.commodityTagColor }">{{ item.commodityTagName }}</span>
            </div>
          </el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" @click="addTag(form)">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>


<script>
import axios from "axios";
import tag from "@/api/TagApi.js";
import tagList from "@/api/TagListApi.js";
import {ElMessage} from "element-plus";
import commodity from "@/api/CommodityApi.js";

export default {
  el: '#app',
  data: function () {
    return {
      Commodity: [],
      tagName: '',
      tagNameId: '',
      fullscreenLoading: false,
      nowTime: '',
      value1: '',
      value: '',
      options: [],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      form: [],
      tableData: [],
      Tag: [],
      videoFile: '',
      title: '',
      username: '',
      tagColor: '',
    }
  },
  created() {
    this.loadTagList()
    this.loadCommodity()
    this.loadTag()
  },
  methods: {
    addTag(info){
      // console.log(this.tagName,this.value)
      tagList.add(this.tagName,this.value).then(res => {
        if (res.code == 200) {
          this.loadTagList()
          ElMessage({
            message: '添加成功',
            type: 'success',
          })
        } else {
          ElMessage.error('添加失败')
          this.loadTagList()
        }
      });
      this.tagName = ''
      this.tagColor = ''
      this.tagNameId = ''
      this.form = []
      this.dialogFormVisible1 = false
    },
    queryTag(info) {
      // console.log(info)
      tagList.query(info).then(res => {
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
    clean() {
      this.value = ''
      this.form = []
      this.tagName = ''
      this.loadTagList()
    },
    updateTag(info) {
      // console.log(info)
      // console.log(this.value)
      tagList.update(this.value, info.commodityTagListId).then(res => {
        if (res.code == 200) {
          this.loadTagList();
          ElMessage({
            message: '更新成功',
            type: 'success',
          })
        } else {
          ElMessage.error('更新失败')
          this.loadTagList();
        }
      });
      this.tagName = ''
      this.tagColor = ''
      this.tagNameId = ''
      this.form = []
      this.dialogFormVisible = false
    },
    openUpdate(info) {
      // console.log(info)
      this.form = []
      this.dialogFormVisible = true
      this.form.commodityTagListId = info.commodityTagListId
      this.tagName = info.commodityName
    },
    TagDel(id) {
      console.log(id)
      tagList.delete(id).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '删除成功',
            type: 'success',
          })
          this.loadTagList();
        } else {
          ElMessage.error('删除失败')
          this.loadTagList();
        }
      });
    },
    openAdd() {
      this.value = ''
      this.form = []
      this.dialogFormVisible1 = true
    },
    loadTagList() {
      tagList.getALL().then((response) => {
        this.tableData = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
    loadTag(){
      tag.getALL().then((response) => {
        this.Tag = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
    loadCommodity() {
      commodity.getALL().then((response) => {
        this.Commodity = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
    },
  }
}

</script>