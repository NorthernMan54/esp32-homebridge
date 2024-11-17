#include <Arduino.h>
#include <map>

class HTTPMessageParser
{
private:
  String statusLine;
  std::map<String, String> headers;
  String body;

  // Helper function to trim leading and trailing whitespace
  String trim(const String &str) const
  {
    int start = 0;
    while (start < str.length() && isspace(str[start]))
      start++;
    int end = str.length() - 1;
    while (end >= 0 && isspace(str[end]))
      end--;
    return str.substring(start, end + 1);
  }

public:
  // Constructor
  HTTPMessageParser() {}

  // Parse the raw HTTP message from a buffer
  bool parse(const char *buffer, size_t length)
  {
    log_i("Parsing HTTP message of length %d", length);
    String data(buffer, length);

    // Find the end of headers (indicated by \r\n\r\n)
    int headerEnd = data.indexOf("\r\n\r\n");
    if (headerEnd == -1)
    {
      return false; // Invalid HTTP message: no header-body delimiter
    }

    // Split into headers and body
    String headerPart = data.substring(0, headerEnd);
    body = data.substring(headerEnd + 4); // Skip \r\n\r\n

    // Extract the status or request line (first line)
    int lineEnd = headerPart.indexOf("\r\n");
    if (lineEnd == -1)
    {
      return false; // Invalid HTTP message: no first line
    }
    statusLine = headerPart.substring(0, lineEnd);

    // Parse headers (lines after the first line)
    int lineStart = lineEnd + 2; // Skip \r\n
    while (lineStart < headerPart.length())
    {
      lineEnd = headerPart.indexOf("\r\n", lineStart);
      if (lineEnd == -1)
        break;

      String line = headerPart.substring(lineStart, lineEnd);
      int colonIndex = line.indexOf(":");
      if (colonIndex != -1)
      {
        String key = trim(line.substring(0, colonIndex));
        String value = trim(line.substring(colonIndex + 1));
        headers[key] = value;
      }
      lineStart = lineEnd + 2; // Move to the next line
    }
    log_i("Parsed HTTP message:");
    return true; // Parsing successful
  }

  // Get the status or request line
  String getStatusLine() const
  {
    return statusLine;
  }

  // Get a specific header value
  String getHeader(const String &key) const
  {
    auto it = headers.find(key);
    return it != headers.end() ? it->second : "";
  }

  // Get all headers as a map
  std::map<String, String> getHeaders() const
  {
    return headers;
  }

  // Get the body of the HTTP message
  String getBody() const
  {
    return body.isEmpty() ? String("") : body;
  }

  // Extract the HTTP status code from the status line (for response messages)
  int getStatusCode() const
  {
    int space1 = statusLine.indexOf(' ');
    int space2 = statusLine.indexOf(' ', space1 + 1);
    if (space1 != -1 && space2 != -1)
    {
      return statusLine.substring(space1 + 1, space2).toInt();
    }
    return -1; // Error: Could not extract status code
  }

  // Extract the HTTP method (for request messages)
  String getMethod() const
  {
    int space1 = statusLine.indexOf(' ');
    if (space1 != -1)
    {
      return statusLine.substring(0, space1);
    }
    return ""; // Error: Could not extract method
  }

  // Extract the request path (for request messages)
  String getPath() const
  {
    int space1 = statusLine.indexOf(' ');
    int space2 = statusLine.indexOf(' ', space1 + 1);
    if (space1 != -1 && space2 != -1)
    {
      return statusLine.substring(space1 + 1, space2);
    }
    return ""; // Error: Could not extract path
  }
};
