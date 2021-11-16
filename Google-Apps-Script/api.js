var Apis = class Api {
  
    constructor(token, options) {
      this.token = token;
      this.options = options;
    }
  
    request(method, data, form, blob) {
      if (!this.token) {
        throw {
          "message": 'Bot Token is required'
        };
      }
      if (!method) {
        throw {
          "message": 'Method is required'
        };
      }
      var options = {
        'method': 'post',
        'contentType': 'application/json'
      };
      if (data) {
        options['payload'] = JSON.stringify(data);
      }
      if (form) {
        options = { 'method': 'post' }
        if (data) options['payload'] = data;
      }
      var url = `${this.options.api}${this.options.type}${this.token}/${method}`;
      var response = UrlFetchApp.fetch(url, options);
      if (response.getResponseCode() == 200) {
        if (blob) {
          return response.getBlob();
        } else {
          return JSON.parse(response.getContentText());
        }
      }
      return false;
    }
  
    invoke(json, object) {
      if (object) {
        for (var key in object) {
          if (Object.hasOwnProperty.call(object, key)) {
            var loop_data = object[key];
            json[key] = loop_data;
          }
        }
        return json;
      } else {
        return json;
      }
    }
  
    invokeSync(json, object) {
      if (object) {
        for (var key in object) {
          if (Object.hasOwnProperty.call(object, key)) {
            var loop_data = object[key];
            json[key] = loop_data;
          }
        }
        return json;
      } else {
        return json;
      }
    }
  
  }