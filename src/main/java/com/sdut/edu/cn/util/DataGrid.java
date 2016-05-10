package com.sdut.edu.cn.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

//import com.i4you.core.entity.AbstractEntity;

/**
 * 用于存储DataGrid数据
 * */
@SuppressWarnings("unchecked")
public class DataGrid implements Serializable {
    private static final long serialVersionUID = 1L;
    /**总条数*/
    private Integer total = 0;
    /**当前页数**/
    private Integer page = 0;
    
    /**每页记录*/
    private Integer pageSize = 0;
    
	/**记录集合*/
    private List rows = new ArrayList();
    
    /**总条数*/
    public Integer getTotal() {
        return total;
    }
    /**总条数*/
    public void setTotal(Integer total) {
        this.total = total;
    }
    /**记录集合*/
    public List getRows() {
        return rows;
    }
    /**记录集合*/
    public void setRows(List rows) {
        this.rows = rows;
    }
    
    public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}
