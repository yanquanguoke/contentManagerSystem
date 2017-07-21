package com.yxb.cms.domain.dto;
/**
 * 分页参数分装
 *
 * @author yangxiaobing
 * @date   2017/7/21
 *
 *
 */
public class PageDto {
	/**当前页**/
	private int page;
	/**每页显示总记录数**/
	private int rows;

	/**每页的开始记录数**/
	private int start;

    protected long totalCount = -1L;

    protected long totalSize = 0;


	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStart() {
		this.start = (page-1)*rows;
		return start;
	}
    public long getTotalCount() {
        return this.totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }
    public long getTotalSize() {
        if (this.totalCount < 0L) {
            return -1L;
        }

        long count = this.totalCount / this.rows;
        if (this.totalCount % this.rows > 0L) {
            count += 1L;
        }
        return count;
    }
	
}
