#include <iostream>
#include <yara.h>
#include <cstring>

using namespace std;

int callback_function(
    int message,
    void* message_data,
    void* user_data)
{
    YR_STRING* s;
    if (CALLBACK_MSG_RULE_MATCHING == message) {

        YR_RULE* rule = static_cast<YR_RULE*>(message_data);

        yr_rule_strings_foreach(rule, s)
        {
            YR_MATCH* match;

            /* string is a YR_STRING object */

            yr_string_matches_foreach(s, match)
            {
              std::cout << "base=" << match->base << " offset=" << match->offset << " length=" << match->length << " data=" << (char*) match->data << "\n";
            }
        }
    }

    return CALLBACK_CONTINUE;
}



int main()
{
    yr_initialize();
    YR_RULES *rules;
    yr_rules_load("/Users/James/dev/src/yara-python/rule.yarac", &rules);

    const char* data = "asdasdasd HOT ashdkajshdkashdkashd HOT ashdkjashkdhaskj HOT sahdjahdk";
    yr_rules_scan_mem(rules, (uint8_t*) data, strlen(data), 0, callback_function, 0, 0);





    yr_finalize();
    // /Users/James/dev/src/yara-python
    cout << "Hello World!" << endl;
    return 0;
}

