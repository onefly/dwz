/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ygsoft.security.service.impl.BaseServiceImpl.java
 * Class:			BaseServiceImpl
 * Date:			2012-10-30
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.security.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.security.service.BaseService;
import com.ketayao.util.dwz.Page;
import com.ketayao.util.dwz.springdata.PageUtils;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-10-30 上午11:22:53 
 */

public class BaseServiceImpl<T, ID extends Serializable> implements BaseService<T, ID> {

	private JpaRepository<T, ID> jpaRepository;
	
	public BaseServiceImpl(JpaRepository<T, ID> jpaRepository) {
		this.jpaRepository = jpaRepository;
	}

	/**   
	 * @param entity  
	 * @see com.ketayao.security.service.BaseService#save(java.lang.Object)  
	 */
	@Transactional
	@Override
	public void save(T entity) {
		jpaRepository.save(entity);
	}

	/**   
	 * @param entity  
	 * @see com.ketayao.security.service.BaseService#update(java.lang.Object)  
	 */
	@Transactional
	@Override
	public void update(T entity) {
		jpaRepository.save(entity);
	}

	/**   
	 * @param id  
	 * @see com.ketayao.security.service.BaseService#delete(java.io.Serializable)  
	 */
	@Transactional
	@Override
	public void delete(ID id) {
		jpaRepository.delete(id);
	}

	/**   
	 * @param id
	 * @return  
	 * @see com.ketayao.security.service.BaseService#get(java.io.Serializable)  
	 */
	@Override
	public T get(ID id) {
		return jpaRepository.findOne(id);
	}

	/**   
	 * @return  
	 * @see com.ketayao.security.service.BaseService#findAll()  
	 */
	@Override
	public List<T> findAll() {
		return jpaRepository.findAll();
	}

	/**   
	 * @param page
	 * @return  
	 * @see com.ketayao.security.service.BaseService#findAll(com.ketayao.util.dwz.Page)  
	 */
	@Override
	public List<T> findAll(Page page) {
		org.springframework.data.domain.Page<T> springDataPage = jpaRepository.findAll(PageUtils.createPageable(page));
		PageUtils.injectPageProperties(page, springDataPage);
		return springDataPage.getContent();
	}
}
