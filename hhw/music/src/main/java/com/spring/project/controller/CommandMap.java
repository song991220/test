package com.spring.project.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class CommandMap {

	/*
	 * <annotation-driven/>을 선언하게 되면 HandlerMethodArgumentResolver는 컨트롤러의 파라미터가 Map
	 * 형식이면 안된다. 우리가 HandlerMethodArgumentResolver를 사용하여 기능을 만들었다고 해도 컨트롤러에서 Map형식으로
	 * 보내오면, 우리가 설정한 클래스가 아닌, Spring에서 기본적으로 설정된 ArgumentResolver를 거쳐가기 때문이다. 물론
	 * <annotation-driven/>을 선언하지않으면 Map을 그대로 써도 된다. 하지만, Spring을 개발하면서
	 * <annotation-driven/>을 선언하는 경우들이 생기기 때문에 우리는 Map 대신에 CommandMap 클래스를 만들어서
	 * 사용한다.
	 */
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	public Object get(String key) {
		return map.get(key);
	}
	
	public void put(String key, Object value) {
		map.put(key, value);
	}
	public Object remove(String key	){
		return map.remove(key);
	}
	
	public boolean containKey(String key) {
		return map.containsKey(key);
	}
	
	public boolean containsValue(Object value) {
		return map.containsValue(value);
	}
	
	public void clear() {
		map.clear();
	}
	
	public Set<Entry<String, Object>> entrySet(){
		return map.entrySet();
	}
	
	public Set<String> keySet(){
		return map.keySet();
	}
	
	public boolean isEmpty() {
		return map.isEmpty();
	}
	
	public void putAll(Map<? extends String, ?extends Object> m) {
		map.putAll(m);
	}
	
	public Map<String, Object> getMap(){
		return map;
	}
	
	
}
