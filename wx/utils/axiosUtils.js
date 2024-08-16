import axios from "axios";

let axiosIntance = axios.create({
  baseURL: "/api",
  headers: {
    "Content-type": "application/json",
  },
  timeout: 10000,
});
//添加请求拦截器
axiosIntance.interceptors.request.use(
  function (config) {
    //在发送请求之前做什么
    const user= localStorage.getItem("user")
    if(user){
      config.headers['token'] = JSON.parse(user).token;
    }
    console.log("我是请求拦截器");
    return config;
  },
  function (error) {
    //对请求错误做什么
    console.log("接收到结果");
    return Promise.reject(error);
  }
);
//响应拦截器
axiosIntance.interceptors.response.use(
  function (response) {
    let data;
    //IE9时response.data是undefined. 因此需要使用response.request.responseText(Stringify后的字符串)
    if (response.data == undefined) {
      data = response.request.responseText;
    } else {
      data = response.data;
    }
    //对响应数据做点什么
    return data;
  },
  function (err) {
    console.log("接收到结果");
    if (err && err.response) {
      console.log(err.response.status);
      switch (err.response.status) {
        case 400:
          err.message = "请求错误";
          break;
        case 401:
          err.message = "未授权，请登录";
          break;
        case 403:
          err.message = "拒绝访问";
          break;
        case 404:
          err.message = "请求地址出错：" + $(err.response.config.url);
          break;
        case 408:
          err.message = "请求超时";
          break;
        case 500:
          err.message = "服务器内部错误";
          break;
        case 501:
          err.message = "服务未实现";
          break;
        case 502:
          err.message = "网关错误";
          break;
        case 503:
          err.message = "服务不可用";
          break;
        case 504:
          err.message = "网关超时";
          break;
        case 505:
          err.message = "HTTP版本不支持";
          break;
      }
    }

    //对相应相应错误做点什么
    return Promise.reject(err);
  }
);
export default axiosIntance;
