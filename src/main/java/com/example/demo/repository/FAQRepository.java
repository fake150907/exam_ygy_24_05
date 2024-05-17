package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.FAQ;

@Mapper
public interface FAQRepository {

	@Select("""

			""")
	int getFAQCount(String searchKeyword);

	@Select("""

			""")
	List<FAQ> getForPrintFAQ(int itemsInAPage, int page, String searchKeyword);

}
