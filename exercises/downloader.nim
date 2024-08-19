# ./downloader [b64 URL]

import httpclient
import std/os
import std/base64

proc downloadFile(url: string) = 
    var client = newHttpClient()
    echo "Plaintext URL: ", url
    try:
        let text = client.getContent(url)
        echo "Content: ", text
    except:
        let e = getCurrentException()
        echo "error ", e.name
        echo e.msg
    finally:
        echo "Done"

echo "Base64 URL: ", paramStr(1)
var url = decode(paramStr(1))
downloadFile(url)