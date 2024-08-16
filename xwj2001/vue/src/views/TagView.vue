<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="12">
          <el-col :span="12">
            <el-button plain @click="openAdd">
              新增标签
            </el-button>
          </el-col>
          <el-col :span="12">
            <el-form :model="form" @submit.native.prevent>
              <el-form-item>
                <el-row :gutter="10">
                  <el-col :span="9">
                    <el-select v-model="value" placeholder="请选择颜色" style="width: 200px">
                      <el-option
                          v-for="item in colors"
                          :key="item.value"
                          :label="item.label"
                          :value="item.value"
                      >
                        <div class="flex items-center">
                          <el-tag :type="item.value" style="margin-right: 8px"></el-tag>
                          <span :style="{ color: item.value }">{{ item.label }}</span>
                        </div>
                      </el-option>
                    </el-select>
                </el-col>
                  <el-col :span="9">
                    <el-input placeholder="请输入名称" v-model="form.commodityTagName" autocomplete="off"/>
                  </el-col>
                  <el-col :span="3">
                    <el-button type="danger" @click="clean">清空</el-button>
                  </el-col>
                  <el-col :span="3">
                    <el-button type="primary" @click="queryTag(form.commodityTagName)">Query</el-button>
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
        <el-table :data="tableData" style="width: 100%">
          <el-table-column prop="commodityTagId" label="标签ID"/>
          <el-table-column prop="commodityTagName" label="标签名称"/>
          <el-table-column label="标签颜色" v-slot="tag">
            <el-tag :type="tag.row.commodityTagColor">&emsp;&emsp;&emsp;</el-tag>
          </el-table-column>
          <el-table-column label="效果" v-slot="tag">
            <el-tag effect="plain" :type="tag.row.commodityTagColor">{{ tag.row.commodityTagName }}</el-tag>
          </el-table-column>
          <el-table-column label="操作" width="200" v-slot="scope">
            <el-button plain @click="openUpdate(scope.row)">
              修改
            </el-button>
            <el-popconfirm :title='"你确定要删除&emsp;" + "<" + scope.row.commodityTagName + ">" + "?"'
                           @confirm='tagDel(scope.row.commodityTagId)'>
              <template #reference>
                <el-button>删除</el-button>
              </template>
            </el-popconfirm>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </div>
  <el-dialog v-model="dialogFormVisible" title="修改标签" width="500">
    <el-form :model="form">
      <el-form-item label="标签名称">
        <el-input v-model="form.tagName" placeholder="请输入标签名称" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="标签样式">
        <el-select v-model="value" placeholder="Select" style="width: 200px">
          <el-option v-for="item in colors" :key="item.value" :label="item.label" :value="item.value">
            <div class="flex items-center">
              <el-tag :type="item.value" style="margin-right: 8px"></el-tag>
              <span :style="{ color: item.value }">{{ item.label }}</span>
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
  <el-dialog v-model="dialogFormVisible1" title="新增标签" width="500">
    <el-form :model="form">
      <el-form-item label="标签名称">
        <el-input v-model="form.tagName" placeholder="请输入标签名称" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="标签样式">
        <el-select v-model="value" placeholder="Select" style="width: 200px">
          <el-option
              v-for="item in colors"
              :key="item.value"
              :label="item.label"
              :value="item.value"
          >
            <div class="flex items-center">
              <el-tag :type="item.value" style="margin-right: 8px"></el-tag>
              <span :style="{ color: item.value }">{{ item.label }}</span>
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
import tag from "@/api/TagApi.js";
import {ElMessage} from "element-plus";

export default {
  data: function () {
    return {
      value: '',
      colors: [
        {
          value: 'primary',
          label: '蓝色',
        },
        {
          value: 'success',
          label: '绿色',
        },
        {
          value: 'info',
          label: '灰色',
        },
        {
          value: 'warning',
          label: '黄色',
        },
        {
          value: 'danger',
          label: '红色',
        }],
      options: [],
      dialogFormVisible: false,
      dialogFormVisible1: false,
      form: [],
      tableData: []
    }
  },
  created() {
    this.loadTag();
  },
  methods: {
    queryTag(info){
      // console.log(info,this.value)
      tag.query(info,this.value).then(res => {
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
      this.loadTag()
    },
    openAdd(){
      this.value = ''
      this.form = []
      this.dialogFormVisible1 = true
    },
    addTag(info){
      // console.log(info)
      tag.add(info.tagName, this.value).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '添加成功',
            type: 'success',
          })
          this.loadTag();
        } else {
          ElMessage.error('添加失败')
          this.loadTag();
        }
      });
      this.dialogFormVisible1 = false
    },
    tagDel(tagId) {
      // console.log(tagId)
      tag.delete(tagId).then(res => {
        if (res.code == 200) {
          ElMessage({
            message: '删除成功',
            type: 'success',
          })
          this.loadTag();
        } else {
          ElMessage.error('删除失败')
          this.loadTag();
        }
      });
    },
    updateTag(info){
      this.dialogFormVisible = false
      tag.update(info.tagId, info.tagName, this.value).then(res => {
        if (res.code == 200){
          this.loadTag();
          ElMessage({
            message: '更新成功',
            type: 'success',
          })
        }
        else {
          ElMessage.error('更新失败')
          this.loadTag();
        }
      });
      this.form = []
    },
    openUpdate(num) {
      // console.log(num)
      this.form = []
      this.dialogFormVisible = true
      this.form.tagId = num.commodityTagId
      this.form.tagName = num.commodityTagName
      this.form.tagColor = num.commodityTagColor
      // console.log(this.form)
    },
    loadTag() {
      tag.getALL().then((response) => {
        this.tableData = response.data
        // console.log(response.data)
        // console.log(this.tableData)
      }).catch((err) => {
        console.log(err);
      })
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