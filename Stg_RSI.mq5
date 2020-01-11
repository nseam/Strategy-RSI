//+------------------------------------------------------------------+
//|                  EA31337 - multi-strategy advanced trading robot |
//|                       Copyright 2016-2020, 31337 Investments Ltd |
//|                                       https://github.com/EA31337 |
//+------------------------------------------------------------------+

/**
 * @file
 * Implements RSI strategy based on Relative Strength Index indicator.
 */

// Inputs.
input int Active_Tf = 127;  // Activated timeframes (1-255) [M1=1,M5=2,M15=4,M30=8,H1=16,H2=32,H4=64...]

// Defines.
#define ea_name "Stg_RSI"
#define ea_version "1.000"
#define ea_desc "Multi-strategy advanced trading robot"
#define ea_link "https://github.com/EA31337/Strategy-RSI"
#define ea_author "kenorb"

// Properties.
#property version ea_version
#ifdef __MQL4__
#property description ea_name
#property description ea_desc
#endif
#property link ea_link
#property copyright "Copyright 2016-2019, 31337 Investments Ltd"

// Includes.
#include "Stg_RSI.mqh"
#include <EA31337-classes/EA.mqh>

// Class variables.
EA *ea;

/* EA event handler functions */

/**
 * Implements "Init" event handler function.
 */
int OnInit() {
  bool _result = true;
  // Initialize EA.
  EAParams ea_params(__FILE__);
  ea = new EA(ea_params);
  // Initialize strategy.
  Collection *_strats = ea.Strategies();
  if ((Active_Tf & M1B)  == M1B)  _strats.Add(Stg_RSI::Init(PERIOD_M1));
  if ((Active_Tf & M5B)  == M5B)  _strats.Add(Stg_RSI::Init(PERIOD_M5));
  if ((Active_Tf & M15B) == M15B) _strats.Add(Stg_RSI::Init(PERIOD_M15));
  if ((Active_Tf & M30B) == M30B) _strats.Add(Stg_RSI::Init(PERIOD_M30));
  if ((Active_Tf & H1B)  == H1B)  _strats.Add(Stg_RSI::Init(PERIOD_H1));
  if ((Active_Tf & H4B)  == H4B)  _strats.Add(Stg_RSI::Init(PERIOD_H4));
  return (_result ? INIT_SUCCEEDED : INIT_FAILED);
}

/**
 * Implements "Tick" event handler function (EA only).
 *
 * Invoked when a new tick for a symbol is received, to the chart of which the Expert Advisor is attached.
 */
void OnTick() {

/*
  MqlTick _tick = market.GetTick();
  bool _tick_procesed = false;
  for (ENUM_TIMEFRAMES_INDEX tfi = 0; tfi < FINAL_ENUM_TIMEFRAMES_INDEX; tfi++) {
    if (Object::IsDynamic(trade[tfi]) && trade[tfi].Chart().IsValidTf()) {
      if (trade[tfi].Chart().IsNewBar()) {
        trade[tfi].Market().SetTick(_tick);
        ProcessBar(trade[tfi]);
        _tick_procesed = true;
      }
    }
  }
  if (_tick_procesed) {
    if (!terminal.IsOptimization()) {
      terminal.Logger().Flush(false);
    }
    if (PrintLogOnChart) {
      DisplayInfo();
    }
  }
*/
}

/**
 * Implements "Deinit" event handler function.
 */
void OnDeinit(const int reason) {
}