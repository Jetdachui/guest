*** Settings ***
Documentation     需要五个参数 ——····预期结果····重命名接口····url····uri····发送参数
Resource          flow.txt

*** Test Cases ***
get_event
    get请求    success    get_event01    http://127.0.0.1:8000/api    /get_event_list/    name=小米7发布会
    get请求    parameter error    get_event02    http://127.0.0.1:8000/api    /get_event_list/
    get请求    query result is empty    get_event03    http://127.0.0.1:8000/api    /get_event_list/    name=小米20发布会

get_guest
    get请求    success    get_guest01    http://127.0.0.1:8000/api    /get_guest_list/    eid=1    phone=18611001100
    get请求    eid cannot be empty    get_guest02    http://127.0.0.1:8000/api    /get_guest_list/    phone=18611001100
    get请求    query result is empty    get_guest03    http://127.0.0.1:8000/api    /get_guest_list/    eid=41    phone=18621001100

add_event
    post请求    event id already exists    add_event_01    http://127.0.0.1:8000/api    /add_event/    eid=21    name=t小米12发布会    limit=2000    address=广    start_time=2021-1-6 12:30:00
    post请求    event name already exists    add_event_02    http://127.0.0.1:8000/api    /add_event/    eid=22    name=t小米12发布会    limit=2000    address=广    start_time=2021-1-6 12:30:00
    post请求    parameter error    add_event_03    http://127.0.0.1:8000/api    /add_event/    name=t小米12发布会    limit=2000
    post请求    start_time format error    add_event_04    http://127.0.0.1:8000/api    /add_event/    eid=25    name=t小米16发布会    limit=2000    address=广    start_time=202
    #post请求    add event success    add_event_05    http://127.0.0.1:8000/api    /add_event/    eid=32    name=t小米32发布会    limit=2000    address=广    start_time=2022-1-6

add_guest
    post请求    parameter error    Alias=add_guest_01    url=http://127.0.0.1:8000/api    uil=/add_guest/    realname=t大锤    phone=18621001100
    post请求    event id null    Alias=add_guest_02    url=http://127.0.0.1:8000/api    uil=/add_guest/    eid=30    realname=t大锤    phone=18621001100
    post请求    event status is not available    Alias=add_guest_03    url=http://127.0.0.1:8000/api    uil=/add_guest/    eid=7    realname=t大锤    phone=18621001100
    post请求    event number is full    Alias=add_guest_04    url=http://127.0.0.1:8000/api    uil=/add_guest/    eid=6    realname=t大锤    phone=18621001100
    post请求    the event guest phone number repeat    Alias=add_guest_05    url=http://127.0.0.1:8000/api    uil=/add_guest/    eid=31    realname=t大锤    phone=18611001100
    post请求    event has started    Alias=add_guest_06    url=http://127.0.0.1:8000/api    uil=/add_guest/    eid=1    realname=t大锤    phone=18621001100
    #post请求    add guest success    Alias=guest    url=http://127.0.0.1:8000/api    uil=/add_guest/    eid=21    realname=t大锤    phone=18621001107

get_sign
    #get请求    asda    sign_00    http://127.0.0.1:8000/api    /user_sign/    eid=1    phone=18611001100
    post请求    parameter error    sign_01    http://127.0.0.1:8000/api    /user_sign/    phone=18611001100
    post请求    event id null    sign_02    http://127.0.0.1:8000/api    /user_sign/    eid=40    phone=18611001100
    post请求    event status is not available    sign_03    http://127.0.0.1:8000/api    /user_sign/    eid=7    phone=18611001100
    post请求    event has started    sign_04    http://127.0.0.1:8000/api    /user_sign/    eid=1    phone=18611001100
    post请求    user phone null    sign_05    http://127.0.0.1:8000/api    /user_sign/    eid=21    phone=18611001120
    post请求    user did not participate in the conference    sign_06    http://127.0.0.1:8000/api    /user_sign/    eid=21    phone=18611001100
    post请求    user has sign in    sign_07    http://127.0.0.1:8000/api    /user_sign/    eid=21    phone=18621001107
