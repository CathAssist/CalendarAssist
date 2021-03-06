#ifndef __CA_CALENDAR_DEFINE_H__
#define __CA_CALENDAR_DEFINE_H__
#include <string>

namespace CathAssist
{
	namespace Calendar
	{
		/*
		 * Days of the Week
		 */
		typedef enum Days
		{
		   SUN = 0, MON, TUE, WED, THU, FRI, SAT
		} day_t;

		static std::string getDayStr(day_t d)
		{
			switch(d)
			{
			case SUN:
				return "星期日";
				break;
			case MON:
				return "星期一";
				break;
			case TUE:
				return "星期二";
				break;
			case WED:
				return "星期三";
				break;
			case THU:
				return "星期四";
				break;
			case FRI:
				return "星期五";
				break;
			case SAT:
				return "星期六";
				break;
			}
			return "Not define";
		}

		/*
		 * Months of the Year
		 */
		typedef enum Months
        {
		   PREVDEC,  JANUARY,   FEBRUARY, MARCH,
		   APRIL,    MAY,       JUNE,     JULY,
		   AUGUST,   SEPTEMBER, OCTOBER, NOVEMBER,
		   DECEMBER, NEXTJAN
		} month_t;
		/*
		 * Liturgical Colors
		 */
		typedef enum Colors
        {
		   NOCOLOR, GREEN, WHITE, RED, PURPLE, ROSE, BLACK
		} color_t;
        
        static std::string getColorStr(color_t c)
        {
            switch(c)
            {
                case NOCOLOR:
                    return "无";
                    break;
                case GREEN:
                    return "绿";
                    break;
                case WHITE:
                    return "白";
                    break;
                case RED:
                    return "红";
                    break;
                case PURPLE:
                    return "紫";
                    break;
                case ROSE:
                    return "玫";
                    break;
                case BLACK:
                    return "黑";
                    break;
            }
            return "Not define";
        }
		/*
		 * Liturgical Ranks
		 */
		typedef enum Ranks
        {
		   WEEKDAY,		/* Plain, old weekdays			*/
		   COMMEMORATION,	/* Commemoration = Memorial in Lent 	*/
		   OPTIONAL,		/* Optional Memorials			*/
		   MEMORIAL,		/* Memorials				*/
		   FEAST,		/* Feasts (not of the Lord)		*/
		   SUNDAY,		/* Sundays 				*/
		   LORD,		/* Feasts of the Lord 			*/
		   ASHWED,		/* Ash Wednesday			*/
		   HOLYWEEK,		/* Mon, Tue, and Wed of Holy Week	*/
		   TRIDUUM,		/* The Triduum				*/
		   SOLEMNITY 		/* Solemnities 				*/
		} rank_t;
        
        static std::string getRankStr(rank_t r)
        {
            switch (r) {
                case WEEKDAY:
                    return "Weekday";
                    break;
                case COMMEMORATION:
                    return "Commemoration";
                    break;
                case OPTIONAL:
                    return "Optional";
                    break;
                case MEMORIAL:
                    return "Memorial";
                    break;
                case FEAST:
                    return "Feast";
                    break;
                case SUNDAY:
                    return "Sunday";
                    break;
                case LORD:
                    return "Lord";
                    break;
                case ASHWED:
                    return "Ashwed";
                    break;
                case HOLYWEEK:
                    return "Holyweek";
                    break;
                case TRIDUUM:
                    return "Triduum";
                    break;
                case SOLEMNITY:
                    return "Solemnity";
                    break;
            }
            return "Not define";
        }
        
		/*
		 * Liturgical Seasons
		 */
		typedef enum Seasons
        {
		   ORDINARY,
		   ADVENT,
		   CHRISTMAS,
		   LENT,
		   EASTER,
		   PASCHAL	/* Ash Wed., Holy Week & Easter Octave 	*/
		} season_t;
        
        static std::string getSeasonStr(season_t s)
        {
            switch(s)
            {
                case ORDINARY:
                    return "常年期";
                    break;
                case ADVENT:
                    return "将临期";
                    break;
                case CHRISTMAS:
                    return "圣诞期";
                    break;
                case LENT:
                    return "四旬期";
                    break;
                case EASTER:
                    return "复活期";
                    break;
                case PASCHAL:
                    return "逾越节";	//Ash Wed., Holy Week & Easter Octave
                    break;
            }
            return "Not define";
        }

		static std::string getChineseNumStr(const int& n)
		{
			static std::string numStr[] = 
			{
				"十",
				"一",
				"二",
				"三",
				"四",
				"五",
				"六",
				"七",
				"八",
				"九",
				"十",
			};


			if(n<1||n>39)
				return "Not define";
			if(n<=10)
			{
				return numStr[n];
			}
			else if(n<20)
			{
				return "十"+numStr[n%10];
			}
			else if(n<30)
			{
				return "廿"+numStr[n%10];
			}
			else if(n<40)
			{
				if(n==30)
					return "三十";
				else
					return "三十"+numStr[n%10];
			}
			
			return "Not define";
		}
	}
}

#endif	//__CA_CALENDAR_DEFINE_H__