import axiosUtils from "@/utils/axiosUtils"
class Home{
    getcCount()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getcCount')
    }
    getctyCount()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getctyCount')
    }
    getcsCount()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getcsCount')
    }
    getaCount()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getaCount')
    }
    getuCount()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getuCount')
    }
    getctCount()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getctCount')
    }
    getTypeTotal()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getTypeTotal')
    }
    getStyleTotal()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getStyleTotal')
    }
    getTagTotal()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getTagTotal')
    }
}

export default new Home();