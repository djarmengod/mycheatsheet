# General Notes

## Error Handling

In the order or frequently see..

### 401 Unauthorized
The request requires user authentication. The response MUST include a WWW-Authenticate header field containing a challenge applicable to the requested resource.  The client MAY repeat the request with a suitable Authorization header fieldIf the request already included Authorization credentials, then the 401 response indicates that authorization has been refused for those credentials. If the 401 response contains the same challenge as the prior response, and the user agent has already attempted authentication at least once, then the user SHOULD be presented the entity that was given in the response, since that entity might include relevant diagnostic information. 

### 403 Forbidden
The server understood the request, but is refusing to fulfill it. Authorization will not help and the request SHOULD NOT be repeated. If the request method was not HEAD and the server wishes to make public why the request has not been fulfilled, it SHOULD describe the reason for the refusal in the entity. If the server does not wish to make this information available to the client, the status code 404 (Not Found) can be used instead.

### 400 (Bad Request)
```
The request could not be understood by the server due to malformed syntax. The client SHOULD NOT repeat the request without modifications. ex: Malformed JSON payload.
```

### 422 (Unprocessable Entity)
```
The 422 (Unprocessable Entity) status code means the server understands the content type of the request entity (hence a 415 (Unsupported Media Type) status code is inappropriate), and the syntax of the request entity is correct (thus a 400 (Bad Request) status code is inappropriate) but was unable to process the contained instructions. For example, this error condition may occur if an XML request body contains well-formed (i.e., syntactically correct), but semantically erroneous, XML instructions.
```

### 401 vs 403 vs 404
Image that we have two users in our system: Sarah, with ID 4, and Tricia, with ID 37. Now, imagine that Sarah makes an authenticated request to view Tricia's profile resource:

```
GET /users/37/profile HTTP/1.1
Authorization: Basic YmVuK2F206dGVzdA==
Accept: application/json
```

Here, Sarah is using Basic Authorization to identify herself as Sarah; however, she's making a request to another user's profile (Tricia's). For sake of argument, let's say that in this API, a user can only view his or her own profile. What HTTP status code should I return?

The three status codes that felt the most appropriate are:

401 - Unauthorized
403 - Forbidden
404 - Not Found
In my mind, the use of each of these three HTTP status codes could be justified. Sarah is not authorized to view Tricia's profile (401); Sarah is forbidden from viewing someone else's profile (403); and, Sarah simply cannot see resources that she's not allowed to view (404).

The initial problem that I had with using either of the HTTP status codes, 401 or 403, was that I felt like it was exposing secure information. Both of those responses sort of say, "Yeah, that resource exists, but you can't see it." My problem with this is that it confirms that those resources exist.

See description for 403.

### 405 Method Not Allowed 
The method specified in the Request-Line is not allowed for the resource identified by the Request-URI. The response MUST include an Allow header containing a list of valid methods for the requested resource.

### 415 Unsupported Media Type
The server is refusing to service the request because the entity of the request is in a format not supported by the requested resource for the requested method.
