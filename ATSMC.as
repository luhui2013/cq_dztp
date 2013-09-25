package  {
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	
	public class ATSMC extends MovieClip {
		private static const WEEK_STR_LIST_CN = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
		private static const WEEK_STR_LIST_EN=new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
		private static const MONTH_STR_LIST = new Array("", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
		
		public var txt_this_train:TextField;
		public var txt_1min:TextField;
		public var txt_this_station:TextField;
		public var txt_next_train:TextField;
		public var txt_destination_station:TextField;
		
		public var txt_first:TextField;
		public var txt_last:TextField;
		public var txt_date:TextField;
		public var txt_week:TextField;
		public var txt_time:TextField;
		
		public var txt_first_val:TextField;
		public var txt_last_val:TextField;
		public var txt_this_station_val:TextField;
		public var txt_next_train_val:TextField;
		public var txt_destination_station_val:TextField;
		
		
        public var _timer:Timer;
		public var _timer_count:int = 0;
		private var _cur_language:String;
		
		private var _ats:AtsData;
		
		public function ATSMC() {
			_cur_language = "cn";
			
			this.txt_this_station.autoSize = TextFieldAutoSize.LEFT;
			this.txt_next_train.autoSize = TextFieldAutoSize.LEFT;
			this.txt_destination_station.autoSize = TextFieldAutoSize.LEFT;
			
			updateView();
			
			_timer = new Timer(1000*1);
			_timer.addEventListener(TimerEvent.TIMER, doTime);
			_timer.start();
		}
		
		
		public function set ats(val:AtsData):void {
			this._ats = val;
		}
		
		private function doTime(e:TimerEvent):void {
			updateView();
		}
        
		private function updateView():void {
			if (_timer_count < 10) {
				_timer_count++;
			}else {
				_cur_language = _cur_language == "cn"?"en":"cn";
				_timer_count = 0;
			}
			
			
			if (_cur_language == "cn") {
				txt_this_train.text = "本次列车";
				txt_1min.text = "1分钟";
				txt_this_station.text = "本站";
				txt_next_train.text = "下一站";
				
				txt_destination_station.text = "本车开往";
				
				txt_first.text = "首班车";
				txt_last.text = "末班车";
				
				txt_first_val.text = _ats==null?"":_ats.first_cn;
				txt_last_val.text = _ats==null?"":_ats.last_cn;
				txt_this_station_val.text = _ats==null?"":_ats.this_station_cn;
				txt_next_train_val.text = _ats==null?"":_ats.next_train_cn;
				txt_destination_station_val.text = _ats == null?"":_ats.destination_station_cn;
				
				updateDateCN();
			}else {
				txt_this_train.text = "This Train";
				txt_1min.text = "1Min";
				txt_this_station.text = "This Station";
				txt_next_train.text = "Next Station";
				
				txt_destination_station.text = "Destination Station";
				
				txt_first.text = "First";
				txt_last.text = "Last";
				
				txt_first_val.text = _ats==null?"":_ats.first_en;
				txt_last_val.text = _ats==null?"":_ats.last_en;
				txt_this_station_val.text = _ats==null?"":_ats.this_station_en;
				txt_next_train_val.text = _ats==null?"":_ats.next_train_en;
				txt_destination_station_val.text = _ats==null?"":_ats.destination_station_en;
				
				updateDateEN();
			}
			
			txt_this_station_val.x = txt_this_station.x + txt_this_station.width + 12;
			txt_next_train_val.x = txt_next_train.x + txt_next_train.width + 12;
			txt_destination_station_val.x = txt_destination_station.x + txt_destination_station.width+12;
		}
		
		
		private function updateDateCN():void {
			
			var _date:Date = new Date();
			
			txt_date.text = _date.getFullYear() + "年" + fullDateStr(_date.getMonth() + 1) + "月" + fullDateStr(_date.getDate()) + "日";
			txt_week.text = WEEK_STR_LIST_CN[_date.getDay()];
			txt_time.text = fullDateStr(_date.getHours()) + ":" + fullDateStr(_date.getMinutes()) + ":" + fullDateStr(_date.getSeconds());
		}
		private function updateDateEN():void {
			var _date:Date = new Date();
			
			txt_date.text =MONTH_STR_LIST[_date.getMonth()+1]+" "+fullDateStr(_date.getDate()) + ",  "+_date.getFullYear();
			txt_week.text = WEEK_STR_LIST_EN[_date.getDay()];
			txt_time.text = fullDateStr(_date.getHours()) + ":" + fullDateStr(_date.getMinutes()) + ":" + fullDateStr(_date.getSeconds());
		}
		private static function fullDateStr(val:int):String {
				if (val <= 9) {
					return "0" + val;
				}
				return val+"";
			}
	}
	
}
