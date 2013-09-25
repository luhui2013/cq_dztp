package  
{
	import flash.display.MovieClip;
	
	import flash.external.ExternalInterface;
	
	/**
	 * ...
	 * @author lu
	 */
	public class App extends MovieClip 
	{
		public var ats_mc:ATSMC;
		private var __debug:Boolean = true;
		private var date:AtsData = null;
		
		
		public function App() 
		{
			if (ExternalInterface.available) {
				ExternalInterface.addCallback("setAtsDate", setAtsDate);
			}
			
			if(__debug){
			   setAtsDate(null);
			}
		}
		
		private function setAtsDate(xml:String):void {
			var data:XML=null;
			
			if(!__debug){
			   data = new XML(xml);
			}else{
			   data=
			<ats>
			   <first_cn>10:00</first_cn>
			   <first_en>10:00</first_en>
			   <last_cn>22:00</last_cn>
			   <last_en>22:00</last_en>
			   <this_station_cn>人民广场</this_station_cn>
			   <this_station_en>People's Square</this_station_en>
			   <next_train_cn>新闸路</next_train_cn>
			   <next_train_en>XinZha Road</next_train_en>
			   <destination_station_cn>上海火车站</destination_station_cn>
			   <destination_station_en>Shanghai Railway Station</destination_station_en>
			 </ats>;
			 
			}
			 
			   
			if (data) {
				var _ats:AtsData = new AtsData();
				_ats.first_cn = data.first_cn;
				_ats.first_en = data.first_en;
				
				_ats.last_cn = data.last_cn;
				_ats.last_en = data.last_en;
				
				_ats.this_station_cn = data.this_station_cn;
				_ats.this_station_en = data.this_station_en;
				
				_ats.next_train_cn = data.next_train_cn;
				_ats.next_train_en = data.next_train_en;
				
				_ats.destination_station_cn = data.destination_station_cn;
				_ats.destination_station_en = data.destination_station_en;
				
				ats_mc.ats = _ats;
				
			}
		}
		
	}

}