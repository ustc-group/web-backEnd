package team.ustc.sse.blockly.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import team.ustc.sse.blockly.entity.Student;
import team.ustc.sse.blockly.mapper.StudentMapper;

/**
 * @program: childrenCode
 * @description: 测试数据库和连接池的配置
 * @author: rgzhang
 * @create: 2019-03-10 22:18
 **/

public class TestStudent {
    private ApplicationContext applicationContext;

    /**
    * @Description: init 方法，用于执行spring的IOC的对象的获取
    * @Param: []
    * @return: void
    * @Author: rgzhang
    * @Date: 2019/3/10
    */
    @Before
    public void init() {
        //获取applicationContext
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring-config.xml");
    }


    @Test
    public void testUpdate(){
        //获取到由spring控制mybatis创建的studentMapper的实现类
        StudentMapper studentMapper = applicationContext.getBean(StudentMapper.class);
        Student student = studentMapper.getStudentByID(5);
        System.out.println(student);

        //注意，用完之后一定不要关闭连接池
    }

}
