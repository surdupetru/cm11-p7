/*
 * Copyright (C) 2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import static com.android.internal.telephony.RILConstants.*;

import android.content.Context;
import android.os.AsyncResult;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.telephony.SmsMessage;
import android.os.SystemProperties;
import android.telephony.SignalStrength;
import android.text.TextUtils;
import android.util.Log;

import com.android.internal.telephony.RILConstants;
import com.android.internal.telephony.gsm.SmsBroadcastConfigInfo;
import com.android.internal.telephony.cdma.CdmaInformationRecords;

import java.util.ArrayList;

public class AscendP7RIL extends RIL implements CommandsInterface {
    boolean RILJ_LOGV = true;
    boolean RILJ_LOGD = true;
	
    static final int RADIO_OFF = 0;
    static final int RADIO_UNAVAILABLE = 1; 
    static final int RADIO_SIM_NOT_READY = 2; 
    static final int RADIO_SIM_LOCKED_OR_ABSENT = 3; 
    static final int RADIO_SIM_READY = 4; 
    static final int RADIO_RUIM_NOT_READY = 5; 
    static final int RADIO_RUIM_READY = 6; 
    static final int RADIO_RUIM_LOCKED_OR_ABSENT = 7; 
    static final int RADIO_NV_NOT_READY = 8; 
    static final int RADIO_NV_READY = 9; 
    static final int RADIO_ON = 10;
    static final int SUB_TO_ACTIVATE = 11;
	
    public AscendP7RIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription);
    }
    @Override
    protected RadioState getRadioStateFromInt(int stateInt) {
        CommandsInterface.RadioState state;
				
        /* RIL_RadioState ril.h */
        switch(stateInt) {
            case 0: 
		state = CommandsInterface.RadioState.RADIO_OFF;
		break;
            case 1: state = CommandsInterface.RadioState.RADIO_UNAVAILABLE;
		break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
	    case 10: 
		state = CommandsInterface.RadioState.RADIO_ON;
		break;
            default:
                throw new RuntimeException("Unrecognized RIL_RadioState: " + stateInt);
        }
        return state;
    }
    
	@Override
    protected RILRequest
    processSolicited (Parcel p) {
        int serial, error;
        boolean found = false;

        serial = p.readInt();
        error = p.readInt();

        RILRequest rr;

        rr = findAndRemoveRequestFromList(serial);

        if (rr == null) {
            Log.w(LOG_TAG, "Unexpected solicited response! sn: "
                            + serial + " error: " + error);
            return null;
        }

        Object ret = null;

        if (error == 0 || p.dataAvail() > 0) {
            // either command succeeds or command fails but with data payload
            try {switch (rr.mRequest) {
            
                  case 1:
                     ret = responseIccCardStatus(p);
                     break ;
                  case 2:
                     ret = responseInts(p);
                     break ;
                  case 3:
                     ret = responseInts(p);
                     break ;
                  case 4:
                     ret = responseInts(p);
                     break ;
                  case 5:
                     ret = responseInts(p);
                     break ;
                  case 6:
                     ret = responseInts(p);
                     break ;
                  case 7:
                     ret = responseInts(p);
                     break ;
                  case 8:
                     ret = responseInts(p);
                     break ;
                  case 9:
                     ret = responseCallList(p);
                     break ;
                  case 10:
                     ret = responseVoid(p);
                     break ;
                  case 11:
                     ret = responseString(p);
                     break ;
                  case 12:
                     ret = responseVoid(p);
                     break ;
                  case 13:
                     ret = responseVoid(p);
                     break ;
                  case 14:
                if ((mTestingEmergencyCall.getAndSet(false)) && (mEmergencyCallbackModeRegistrant != null)) {
                        riljLog("testing emergency call, notify ECM Registrants");
                        mEmergencyCallbackModeRegistrant.notifyRegistrant();
                    }
                     ret = responseVoid(p);
                     break ;
                  case 15:
                     ret = responseVoid(p);
                     break ;
                  case 539:
                     ret = responseVoid(p);
                     break ;
                  case 16:
                     ret = responseVoid(p);
                     break ;
                  case 17:
                     ret = responseVoid(p);
                     break ;
                  case 18:
                     ret = responseInts(p);
                     break ;
                  case 19:
                     ret = responseSignalStrength(p);
                     break ;
                  case 20:
                     ret = responseStrings(p);
                     break ;
                  case 21:
                     ret = responseStrings(p);
                     break ;
                  case 22:
                     ret = responseStrings(p);
                     break ;
                  case 23:
                     ret = responseVoid(p);
                     break ;
                  case 24:
                     ret = responseVoid(p);
                     break ;
                  case 25:
                     ret = responseSMS(p);
                     break ;
                  case 513:
                     ret = responseStrings(p);
                     break ;
                  case 515:
                     ret = responseStrings(p);
                     break ;
                  case 514:
                     ret = responseStrings(p);
                     break ;
                  case 516:
                     ret = responseStrings(p);
                     break ;
                  case 517:
                     ret = responseStrings(p);
                     break ;
                  case 518:
                     ret = responseStrings(p);
                     break ;
                  case 26:
                     ret = responseSMS(p);
                     break ;
                  case 27:
                     ret = responseSetupDataCall(p);
                     break ;
                  case 28:
                     ret = responseICC_IO(p);
                     break ;
                  case 523:
                     ret = responseICC_IO(p);
                     break ;
                  case 524:
                     ret = responseInts(p);
                     break ;
                  case 525:
                     ret = responseVoid(p);
                     break ;
                  case 526:
                     ret = responseICC_IO(p);
                     break ;
                  case 538:
                     ret = responseString(p);
                     break ;
                  case 29:
                     ret = responseVoid(p);
                     break ;
                  case 30:
                     ret = responseVoid(p);
                     break ;
                  case 31:
                     ret = responseInts(p);
                     break ;
                  case 32:
                     ret = responseVoid(p);
                     break ;
                  case 33:
                     ret = responseCallForward(p);//ok
                     break ;
                  case 34:
                     ret = responseVoid(p);
                     break ;
                  case 35:
                     ret = responseInts(p);
                     break ;
                  case 36:
                     ret = responseVoid(p);
                     break ;
                  case 37:
                     ret = responseVoid(p);
                     break ;
                  case 38:
                     ret = responseString(p);
                     break ;
                  case 39:
                     ret = responseString(p);
                     break ;
                  case 40:
                     ret = responseVoid(p);
                     break ;
                  case 41:
                     ret = responseVoid(p);
                     break ;
                  case 42:
                     ret = responseInts(p);
                     break ;
                  case 43:
                     ret = responseInts(p);
                     break ;
                  case 44:
                     ret = responseVoid(p);
                     break ;
                  case 45:
                     ret = responseInts(p);
                     break ;
                  case 46:
                     ret = responseVoid(p);
                     break ;
                  case 47:
                     ret = responseVoid(p);
                     break ;
                  case 48:
                     ret = responseOperatorInfos(p); //ok
                     break ;
                  case 49:
                     ret = responseVoid(p);
                     break ;
                  case 50:
                     ret = responseVoid(p);
                     break ;
                  case 51:
                     ret = responseString(p);
                     break ;
                  case 52:
                     ret = responseVoid(p);
                     break ;
                  case 53:
                     ret = responseVoid(p);
                     break ;
                  case 54:
                     ret = responseInts(p);
                     break ;
                  case 55:
                     ret = responseInts(p);
                     break ;
                  case 56:
                     ret = responseInts(p);
                     break ;
                  case 57:
                     ret = responseDataCallList(p); //ok
                     break ;
                  case 58:
                     ret = responseVoid(p);
                     break ;
                  case 59:
                     ret = responseRaw(p);
                     break ;
                  case 60:
                     ret = responseStrings(p);
                     break ;
                  case 61:
                     ret = responseVoid(p);
                     break ;
                  case 62:
                     ret = responseVoid(p);
                     break ;
                  case 63:
                     ret = responseInts(p);
                     break ;
                  case 64:
                     ret = responseVoid(p);
                     break ;
                  case 65:
                     ret = responseVoid(p);
                     break ;
                  case 66:
                     ret = responseInts(p);
                     break ;
                  case 67:
                     ret = responseString(p);
                     break ;
                  case 68:
                     ret = responseVoid(p);
                     break ;
                  case 69:
                     ret = responseString(p);
                     break ;
                  case 70:
                     ret = responseVoid(p);
                     break ;
                  case 71:
                     ret = responseInts(p);
                     break ;
                  case 72:
                     ret = responseVoid(p);
                     break ;
                  case 73:
                     ret = responseVoid(p);
                     break ;
                  case 74:
                     ret = responseGetPreferredNetworkType(p); //ok
                     break ;
                  case 75:
                     ret = responseCellList(p);
                     break ;
                  case 76:
                     ret = responseVoid(p);
                     break ;
                  case 77:
                     ret = responseVoid(p);
                     break ;
                  case 78:
                     ret = responseVoid(p);
                     break ;
                  case 79:
                     ret = responseInts(p);
                     break ;
                  case 80:
                     ret = responseVoid(p);
                     break ;
                  case 81:
                     ret = responseInts(p);
                     break ;
                  case 82:
                     ret = responseVoid(p);
                     break ;
                  case 83:
                     ret = responseInts(p);
                     break ;
                  case 84:
                     ret = responseVoid(p);
                     break ;
                  case 85:
                     ret = responseVoid(p);
                     break ;
                  case 87:
                     ret = responseSMS(p);
                     break ;
                  case 88:
                     ret = responseVoid(p);
                     break ;
                  case 89:
                     ret = responseGmsBroadcastConfig(p); //ok
                     break ;
                  case 90:
                     ret = responseVoid(p);
                     break ;
                  case 92:
                     ret = responseVoid(p);
                     break ;
                  case 93:
                     ret = responseCdmaBroadcastConfig(p);
                     break ;
                  case 91:
                     ret = responseVoid(p);
                     break ;
                  case 86:
                     ret = responseVoid(p);
                     break ;
                  case 94:
                     ret = responseVoid(p);
                     break ;
                  case 95:
                     ret = responseStrings(p);
                     break ;
                  case 96:
                     ret = responseInts(p);
                     break ;
                  case 97:
                     ret = responseVoid(p);
                     break ;
                  case 98:
                     ret = responseStrings(p);
                     break ;
                  case 100:
                     ret = responseString(p);
                     break ;
                  case 101:
                     ret = responseVoid(p);
                     break ;
                  case 99:
                     ret = responseVoid(p);
                     break ;
                  case 102:
                     ret = responseVoid(p);
                     break ;
                  case 103:
                     ret = responseVoid(p);
                     break ;
                  case 104:
                     ret = responseInts(p);
                     break ;
                  case 105:
                     ret = responseString(p);
                     break ;
                  case 108:
                     ret = responseInts(p);
                     break ;
                  case 109:
                     ret = responseCellInfoList(p);//ok
                     break ;
                  case 110:
                     ret = responseVoid(p);
                     break ;
                  case 111:
                     ret = responseVoid(p);
                     break ;
                  case 112:
                     ret = responseInts(p);
                     break ;
                  case 113:
                     ret = responseSMS(p);
                     break ;
                  case 512:
                     ret = responseVoid(p);
                     break ;
                  case 507:
                     ret = responseVoid(p);
                     break ;
                  case 508:
                     ret = responseVoid(p);
                     break ;
                  case 509:
                     ret = responseUiccSubscription(p);//ok
                     break ;
                  case 510:
                     ret = responseInts(p);
                     break ;
                  case 511:
                     ret = responseVoid(p);
                     break ;
                  case 106:
                     ret = responseVoid(p);
                     break ;
                  case 107:
                     ret = responseICC_IO(p);
                     break ;
                  case 503:
                     ret = responseVoid(p);
                     break ;
                  case 501:
                     ret = responseVoid(p);
                     break ;
                  case 502:
                     ret = responseVoid(p);
                     break ;
                  case 519:
                     ret = responseVoid(p);
                     break ;
                  case 520:
                     ret = responseVoid(p);
                     break ;
                  case 521:
                     ret = responseVoid(p);
                     break ;
                  case 522:
                     ret = responseVoid(p);
                     break ;
                  case 534:
                     ret = responseVoid(p);
                     break ;
                  case 536:
                     ret = responseVoid(p);
                     break ;
                  case 537:
                     ret = responseVoid(p);
                     break ;
                  case 540:
                     ret = responseVoid(p);
                     break ;
            default:
                throw new RuntimeException("Unrecognized solicited response: " + rr.mRequest);
            //break;
 	           }
	   } catch (Throwable tr) {
                // Exceptions here usually mean invalid RIL responses

                Log.w(LOG_TAG, rr.serialString() + "< "
                        + requestToString(rr.mRequest)
                        + " exception, possible invalid RIL response", tr);

                if (rr.mResult != null) {
                    AsyncResult.forMessage(rr.mResult, null, tr);
                    rr.mResult.sendToTarget();
                }
                return rr;
            }
        }

        // Here and below fake RIL_UNSOL_RESPONSE_SIM_STATUS_CHANGED, see b/7255789.
        // This is needed otherwise we don't automatically transition to the main lock
        // screen when the pin or puk is entered incorrectly.
        switch (rr.mRequest) {
         case 3:
         case 5:
            if(mIccStatusChangedRegistrants != null) {
               riljLog("ON enter sim puk fakeSimStatusChanged: reg count=" + mIccStatusChangedRegistrants.size());
               mIccStatusChangedRegistrants.notifyRegistrants();
            }
         case 4:
         default:
            if(error != 0) {
               switch(rr.mRequest) {
               case 2:
               case 4:
               case 6:
               case 7:
               case 43:
                  if(mIccStatusChangedRegistrants != null) {
                     riljLog("ON some errors fakeSimStatusChanged: reg count=" + mIccStatusChangedRegistrants.size());
                     mIccStatusChangedRegistrants.notifyRegistrants();
                  }
               default:
                  rr.onError(error, ret);
               }
            } else {
               riljLog(rr.serialString() + "< " + requestToString(rr.mRequest) + " " + retToString(rr.mRequest, ret));
               if(rr.mResult != null) {
                  AsyncResult.forMessage(rr.mResult, ret, (Throwable)null);
                  rr.mResult.sendToTarget();
               }
             }       
           }
	  return rr;
        }

    @Override
    protected void
    processUnsolicited (Parcel p) {
      Object ret;
        int dataPosition = p.dataPosition(); // save off position within the Parcel
        int response = p.readInt();

      switch(response) {
	
      case RIL_UNSOL_SIGNAL_STRENGTH: 
	 ret = responseSignalStrength(p); break;

      case 1010:
         ret = responseSuppServiceNotification(p); break;
      case 1011:
         ret = responseVoid(p); break;
      case 1012:
         ret = responseString(p); break;
      case 1013:
         ret = responseString(p); break;
      case 1014:
         ret = responseInts(p); break;
      case 1015:
         ret = responseVoid(p); break;
      case 1016:
         ret = responseSimRefresh(p); break;
      case 1017:
         ret = responseCallRing(p); break;
      case 1018:
         ret = responseString(p); break;
      case 1019:
         ret = responseInts(p); break;
      case 1020:
         ret = responseVoid(p); break;
      case 1021:
         ret = responseCdmaSms(p); break;
      case 1022:
         ret = responseRaw(p); break;
      case 1023:
         ret = responseVoid(p); break;
      case 1024:
         ret = responseVoid(p); break;
      case 1025:
         ret = responseCdmaCallWaiting(p); break;
      case 1026:
         ret = responseInts(p); break;
      case 1027:
         ret = responseCdmaInformationRecord(p); break;
      case 1028:
         ret = responseRaw(p); break;
      case 1029:
         ret = responseInts(p); break;
      case 1030:
         ret = responseVoid(p); break;
      case 1031:
         ret = responseInts(p); break;
      case 1032:
         ret = responseInts(p); break;
      case 1033:
         ret = responseVoid(p); break;
      case 1510:
         ret = responseInts(p); break;
      case 1034:
         ret = responseString(p); break;
      case 1501:
         ret = responseInts(p); break;
      case 1035:
         ret = responseCellInfoList(p); break;
      case 1036:
         ret = responseVoid(p); break;
      case 1505:
         ret = responseInts(p); break;
      case 1504:
         ret = responseString(p); break;
      case 1506:
         ret = responseInts(p); break;
      case 1507:
         ret = responseStrings(p); break;
      case 1508:
         ret = responseInts(p); break;
      case 1502:
         ret = responseInts(p); break;
      case 1511:
         ret = responseInts(p); break;
      case 1517:
         ret = responseVoid(p); break;
      case 1516:
         ret = responseVoid(p); break;
      case 1512:
         ret = responseVoid(p); break;
      case 1513:
         ret = responseStrings(p); break;

      default:
                // Rewind the Parcel
                p.setDataPosition(dataPosition);

                // Forward responses that we are not overriding to the super class
                super.processUnsolicited(p);
                return;
        }

        switch(response) {
			case RIL_UNSOL_SIGNAL_STRENGTH:
                // Note this is set to "verbose" because it happens
                // frequently
                if (RILJ_LOGV) unsljLogvRet(response, ret);

                if (mSignalStrengthRegistrant != null) {
                    mSignalStrengthRegistrant.notifyRegistrant(
                                        new AsyncResult (null, ret, null));
                }
            break;
            case 1502:
		setPreferredNetworkType(mPreferredNetworkType, null);
                setCdmaSubscriptionSource(mCdmaSubscription, null);

                break;
            case 1501:
            case 1504:
            case 1505:
            case 1506:
            case 1507:
            case 1508:
            case 1510:
            case 1511:
            case 1512:
            case 1513:
            case 1516:
            case 1517:
                break;
            }
    }

    @Override
    protected Object
	responseSignalStrength(Parcel p) {
      int[] response = new int[12];
	  boolean noLte = false;
		
        for (int i = 0 ; i < 12 ; i++) {
            response[i] = p.readInt();
		if (RILJ_LOGV) riljLog("response:" + response[i]);
        if ((noLte) && i > 6 && i < 12) {
                response[i] = -1;
            }
		if (i == 1 && response[i] == 99) {
		response[1] = -1; // GsmBitErrorRate
			}
		if (i == 7 && response[i] == 99) {
                response[i] = -1;
                noLte = true;
            }
		if (RILJ_LOGV) riljLog("noLte:" + noLte);	
		}

	  if (response[0] == 0 && response[2] < -1) {
	  response[0] = (response[2] + 113) /2;
	  } 
	  if (response[2] == -1 && response[0] < 0) {
	  response[0] = (response[0] + 113) /2;
	  } 
	  
      return new SignalStrength(response[0], response[1], response[2], response[3], response[4], response[5], response[6], response[7],response[8], response[9], response[10], response[11], true);
   }
  
    private Object responseUiccSubscription(Parcel p) {
      return null;
   }

}
