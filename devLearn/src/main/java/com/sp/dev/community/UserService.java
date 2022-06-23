package com.sp.dev.community;

import java.util.Map;

public interface UserService {
	public Map<String, Object> serializeNode(String spec);
	public String documentWriter(String spec);
}
