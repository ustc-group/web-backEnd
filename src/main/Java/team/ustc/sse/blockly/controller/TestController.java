package team.ustc.sse.blockly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: childrenCode
 * @description: 测试配置文件
 * @author: rgzhang
 * @create: 2019-03-10 15:32
 **/


@Controller
public class TestController {

    /**
    * @Description: test
    * @Param: []
    * @return: java.lang.String
    * @Author: rgzhang
    * @Date: 2019/3/10
    */
    @RequestMapping("index")
    public String index(){
        System.out.println("hello!");
        return "hello";
    }
}
