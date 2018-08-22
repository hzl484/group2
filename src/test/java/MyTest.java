import cn.gezhi.mapper.EmployeeMapper;
import cn.gezhi.po.Employee;
import cn.gezhi.service.EmployeeService;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml","classpath:spring-placeholder.xml"})
public class MyTest {
    @Autowired
    EmployeeService employeeService;

    @Test
    public void test1() {
        PageInfo<Employee> pageInfo = employeeService.showeEmployee(1,10);
        List<Employee> list = pageInfo.getList();
        for (Employee employee:list
             ) {
            System.out.println(employee);
        }
    }


}
