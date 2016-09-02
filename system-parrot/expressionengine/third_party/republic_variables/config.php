<?php
/*

                                    __/---\__
                     ,___     ___  /___o--\  \
                      \_ o---/ _/          )--)
                        \-----/           ______
                                          |    |
                                          |    |
                    ---_    ---_    ---_  |    |
                    |   \__ |   \__ |   \__    |
                    |      \__     \__     \__ o
                    |         `       `      \__
                    |                          |
                    |                          |
                    |__________________________|

                    | ) |_´ | ) | | |_) |  | / '
                    | \ |_, |´  \_/ |_) |_,| \_,
                            F A C T O R Y

Republic Variables made by Republic Factory AB <http://www.republic.se> and is
licensed under a Creative Commons Attribution-NoDerivs 3.0 Unported License
<http://creativecommons.org/licenses/by-nd/3.0/>.

You can use it for free, both in personal and commercial projects as long as
this attribution in left intact. But, by downloading this add-on you also take
full responsibility for anything that happens while using it. The add-on is
made with love and passion, and is used by us on daily basis, but we cannot
guarantee that it works equally well for you.

See Republic Labs site <http://republiclabs.com> for more information.

*/

define('REPUBLIC_VARIABLES_VERSION', '2.0.6');
define('REPUBLIC_VARIABLES_DOCS', 'http://republiclabs.com/expressionengine/republic-variables');

/**
 * < EE 2.6.0 backward compat
 */
if (!function_exists('ee')) {
    function ee()
    {
        static $EE;
        if (! $EE) {
            $EE = get_instance();
        }

        return $EE;
    }
}

// define the old remove_double_slashes function
if (!function_exists('remove_double_slashes')) {
    function remove_double_slashes($str)
    {
        return preg_replace("#(^|[^:])//+#", "\\1/", $str);
    }
}
