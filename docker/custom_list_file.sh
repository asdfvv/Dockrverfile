#宠汪汪积分兑换奖品
#0 0-16/8 * * * node /scripts/jd_joy_reward.js  >> /scripts/logs/jd_joy_reward.log 2>&1

#11 0 * * * node /scripts/jd_plusmh.js  >> /scripts/logs/jd_plusmh.log 2>&1

#30,31 20-23/1 5,9,12 3 * node /scripts/jd_live_redrain.js  >> /scripts/logs/jd_live_redrain.log 2>&1

3 */1 * * * node /scripts/jd_live_lottery_social.js  >> /scripts/logs/jd_live_lottery_social.log 2>&1

0 17 * * * curl https://raw.githubusercontent.com/cui521/jdqd/main/DIY_shopsign.js > /scripts/DIY_shopsign.js

26 17 * * * node /scripts/DIY_shopsign.js >> /scripts/logs/DIY_shopsign.log 2>&1
