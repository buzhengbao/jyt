<script>
export default {
  name: "GoodsView.Vue"
}
</script>

<template>
  <el-card style="margin-top: 10px; min-height: 600px" shadow="always">
    <el-row :gutter="20">
      <el-col :span="4">
        <div class="grid-content ep-bg-purple"/>
        <el-card style="min-height: 600px" shadow="always">
          <el-col>
            <el-menu
                default-active="1"
                class="el-menu-vertical-demo"
                :ellipsis="false"
                style="min-height: 500px"
            >
              <el-sub-menu index="1">
                <template #title>
                  <el-icon>
                    <Menu/>
                  </el-icon>
                  商品管理
                </template>
                <RouterLink to="/goodsMenu">
                  <el-menu-item index="1-1">
                    <el-icon>
                      <Goods/>
                    </el-icon>
                    商品
                  </el-menu-item>
                </RouterLink>
                <RouterLink to="/goodsMenu/commodityImg">
                  <el-menu-item index="1-2">
                    <el-icon>
                      <Picture/>
                    </el-icon>
                    商品图片
                  </el-menu-item>
                </RouterLink>
                <RouterLink to="/goodsMenu/commodityTagList">
                  <el-menu-item index="1-3">
                    <el-icon>
                      <WindPower/>
                    </el-icon>
                    商品标签
                  </el-menu-item>
                </RouterLink>
              </el-sub-menu>
              <RouterLink to="/goodsMenu/commodityStyle">
                <el-menu-item index="3">
                  <el-icon>
                    <Star/>
                  </el-icon>
                  商品款式管理
                </el-menu-item>
              </RouterLink>
              <RouterLink to="/goodsMenu/commodityType">
                <el-menu-item index="4">
                  <el-icon>
                    <Discount/>
                  </el-icon>
                  商品类型管理
                </el-menu-item>
              </RouterLink>
              <RouterLink to="/goodsMenu/commodityTag">
                <el-menu-item index="5">
                  <el-icon>
                    <Postcard/>
                  </el-icon>
                  商品标签管理
                </el-menu-item>
              </RouterLink>
              <RouterLink to="/goodsMenu/activity">
                <el-menu-item index="6">
                  <el-icon>
                    <ReadingLamp/>
                  </el-icon>
                  活动管理
                </el-menu-item>
              </RouterLink>
              <RouterLink to="/goodsMenu/order">
                <el-menu-item index="7">
                  <el-icon>
                    <ShoppingCart/>
                  </el-icon>
                  订单管理
                </el-menu-item>
              </RouterLink>
              <RouterLink to="/goodsMenu/log">
                <el-menu-item index="8">
                  <el-icon>
                    <Tickets />
                  </el-icon>
                  日志管理
                </el-menu-item>
              </RouterLink>
            </el-menu>
          </el-col>
        </el-card>
      </el-col>
      <el-col :span="20">
        <div class="grid-content ep-bg-purple"/>
        <el-card style="min-height: 600px" shadow="always">
          <RouterView/>
        </el-card>
      </el-col>
    </el-row>
  </el-card>
</template>


<style>

</style>