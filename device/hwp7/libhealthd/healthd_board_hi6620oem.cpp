/*
 * Copyright (C) 2013 The Android Open Source Project
 * Copyright (C) 2013 The CyanogenMod Project
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

#include <healthd.h>

void healthd_board_init(struct healthd_config *config)
{
    config->batteryStatusPath            = "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/status";
    config->batteryHealthPath            = "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/health";
    config->batteryPresentPath           = "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/present";
    config->batteryCapacityPath          = "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/capacity";
    config->batteryVoltagePath           = "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/voltage_now";
    config->batteryTemperaturePath       = "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/temp";
    config->batteryTechnologyPath        = "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/technology";
    config->batteryCurrentNowPath        = "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/current_now";
}

int healthd_board_battery_update(struct android::BatteryProperties *props)
{

    // return 0 to log periodic polled battery status to kernel log
    return 0;
}
