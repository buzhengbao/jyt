import axiosUtils from "@/utils/axiosUtils"
class Log{
    getALL()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getLog')
    }
    query(LogName,LogBeginTime){
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getLogName/', {LogName:LogName,LogBeginTime:LogBeginTime})
    }
    delete(LogId)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteLogById/'+LogId)
    }
}

export default new Log();