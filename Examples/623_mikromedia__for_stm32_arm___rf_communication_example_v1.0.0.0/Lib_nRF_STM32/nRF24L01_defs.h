/**************************************************************************************************
* Project Name: nRF definitions
* Company: (c) mikroElektronika, 2012
* Revision History:
*     20120724 (DA):
*       - initial release;
* Description:
*     This project contains definitions used by API functions for NORDIC nRF24L01+.
**************************************************************************************************/

#define _T5_Reload           65532
#define _T2_Reload           32768

#define nRF_ADR_LENGTH           5     // 5 bytes TX(RX) address width
#define nRF_TX_PLOAD_WIDTH       32    // 16 bytes TX payload
#define nRF_RX_PLOAD_WIDTH       32    // 16 bytes RX payload

// Define nRF24L01 interrupt flag's
#define nRF_IDLE                 0x00  // Idle, no interrupt pending
#define nRF_MAX_RT               0x10  // Max #of TX retrans interrupt
#define nRF_TX_DS                0x20  // TX data sent interrupt
#define nRF_RX_DR                0x40  // RX data received
#define nRF_PEDING               0x80  // Peding

// SPI(nRF24L01) commands
#define nRF_READ_REG             0x00  // Define read command to register
#define nRF_WRITE_REG            0x20  // Define write command to register
#define nRF_RD_RX_PLOAD          0x61  // Define RX payload register address
#define nRF_WR_TX_PLOAD          0xA0  // Define TX payload register address
#define nRF_FLUSH_TX             0xE1  // Define flush TX register command
#define nRF_FLUSH_RX             0xE2  // Define flush RX register command
#define nRF_REUSE_TX_PL          0xE3  // Define reuse TX payload register command
#define nRF_NOP                  0xFF  // Define No Operation, might be used to read status register

// SPI(nRF24L01) registers(addresses)
#define nRF_CONFIG               0x00  // 'Config' register address
#define nRF_EN_AA                0x01  // 'Enable Auto Acknowledgment' register address
#define nRF_EN_RXADDR            0x02  // 'Enabled RX addresses' register address
#define nRF_SETUP_AW             0x03  // 'Setup address width' register address
#define nRF_SETUP_RETR           0x04  // 'Setup Auto. Retrans' register address
#define nRF_RF_CH                0x05  // 'RF channel' register address
#define nRF_RF_SETUP             0x06  // 'RF setup' register address
#define nRF_STATUS               0x07  // 'Status' register address
#define nRF_OBSERVE_TX           0x08  // 'Observe TX' register address
#define nRF_CD                   0x09  // 'Carrier Detect' register address
#define nRF_RX_ADDR_P0           0x0A  // 'RX address pipe0' register address
#define nRF_RX_ADDR_P1           0x0B  // 'RX address pipe1' register address
#define nRF_RX_ADDR_P2           0x0C  // 'RX address pipe2' register address
#define nRF_RX_ADDR_P3           0x0D  // 'RX address pipe3' register address
#define nRF_RX_ADDR_P4           0x0E  // 'RX address pipe4' register address
#define nRF_RX_ADDR_P5           0x0F  // 'RX address pipe5' register address
#define nRF_TX_ADDR              0x10  // 'TX address' register address
#define nRF_RX_PW_P0             0x11  // 'RX payload width, pipe0' register address
#define nRF_RX_PW_P1             0x12  // 'RX payload width, pipe1' register address
#define nRF_RX_PW_P2             0x13  // 'RX payload width, pipe2' register address
#define nRF_RX_PW_P3             0x14  // 'RX payload width, pipe3' register address
#define nRF_RX_PW_P4             0x15  // 'RX payload width, pipe4' register address
#define nRF_RX_PW_P5             0x16  // 'RX payload width, pipe5' register address
#define nRF_FIFO_STATUS          0x17  // 'FIFO Status Register' register address

// Definitions used in TEST application
#define nRF_FALSE                0x00  // Simple true/false constants
#define nRF_TRUE                 0x01

#define nRF_CLEAR                0x00

#define nRF_FREQ_TABLE_SIZE      0x10
#define nRF_TX_PLOAD_MAX_WIDTH   0x20
#define nRF_RX_PLOAD_MAX_WIDTH   0x20  // RX payload length = 32 bytes
#define nRF_NUM_OF_PIPES         0x06
#define nRF_TX_ADDR_WIDTH        0x05
#define nRF_TRANS_PARAMS         0x02
#define nRF_TRANS_SOURCE         0x00
#define nRF_TRANS_VALUE          0x01
#define nRF_TIMER                0x00
#define nRF_BUTTON               0x01
#define nRF_TX_MODE              0x00
#define nRF_RX_MODE              0x01
#define nRF_IDLE_MODE            0x02
#define nRF_MASK_IRQ_FLAGS       0x70
#define nRF_MASK_RX_DR_FLAG      0x40
#define nRF_MASK_TX_DS_FLAG      0x20
#define nRF_MASK_MAX_RT_FLAG     0x10
#define nRF_RX_P_NO              0x0e

#define nRF_RX_FIFO_EMPTY        0x07
#define nRF_RX_EMPTY             0x01

#define nRF_PIPE0                0x00
#define nRF_PIPE1                0x01
#define nRF_PIPE2                0x02
#define nRF_PIPE3                0x03
#define nRF_PIPE4                0x04
#define nRF_PIPE5                0x05

#define nRF_LINK_STATUS          0x00
#define nRF_LINK_CHANNEL         0x01
#define nRF_LINK_NO_MESS         0x00
#define nRF_LINK_LOSS            0x01
#define nRF_LINK_ESTABLISH       0x02
#define nRF_LINK_RELOST          0x03
#define nRF_STOP                 0x04

#define nRF_CLEARED              0x00
#define nRF_TIMEOUT              0x01

// CE_Action definitions
#define nRF_CE_LOW               0x00
#define nRF_CE_HIGH              0x01
#define nRF_CE_PULSE             0x02

// Implemented HOST commands
#define nRF_CSN_STATE            0x01  // Set state of CSN(SSN) signal
#define nRF_SPI_COMMAND          0x02  // Perform a SPI read/write operation
#define nRF_CE_BIT               0x03  // Set state of CE signal
#define nRF_FW_VER               0x04  // Returns FirmWare version of this system
#define nRF_READ_USB_ID          0x05  // Returns the rotary switch value
#define nRF_WRITE_LEDS           0x06  // Turn LEDs on/off
#define nRF_WR_FLASH_BLOCK       0x07  // Writes 32 bytes of flash data to block 'n'
#define nRF_RD_FLASH_BLOCK       0x08  // Reads and return 32 bytes of flash block 'n'
#define nRF_WR_FLASH_PAGE        0x09  // Writes the flash page n*256 buffer to flash
#define nRF_RD_FLASH_PAGE        0x0a  // Read the n*256 flash page to flash buffer
#define nRF_WD_RESET             0x0b  // Perform a WD reset
#define nRF_READ_LOCK_BYTE       0x0c  // Returns the F32x device lock byte...
#define nRF_SPI_SELECT           0x0d  // Select between HW and SW SPI mode
#define nRF_UNUSED               0x0e  // Not used command
#define nRF_ST_FR_SWEEP_TX       0x0f  // Start freq.sweep, TX, from channel 'cl' to 'ch' in 20ms intervals
#define nRF_ST_FR_SWEEP_RX       0x10  // Start freq.sweep, RX, from channel 'cl' to 'ch' in 20ms intervals
#define nRF_STOP_SWEEP           0x11  // Stop either the TX or the RX freq.sweep execution....
#define nRF_WR_TRANS_CTRL        0x12  // Select between auto. or manual transmission(TX device)
#define nRF_RD_TRANS_CTRL        0x13  // Read Transmit Control state
#define nRF_WR_FREQ_AGIL         0x14  // Select Freq. Agility for pipe.n
#define nRF_RD_FREQ_AGIL         0x15  // Read freq agility state for pipe.n
#define nRF_WR_CH_TABLE          0x16  // Writes the 16 ch's used for freq. agility
#define nRF_RD_CH_TABLE          0x17  // Read the 16 ch's used for agility
#define nRF_WR_TX_PAYLOAD        0x18  // Writes n bytes of payload data
#define nRF_START_COM_MODE       0x19  // Starts the communication mode, (application)
#define nRF_READ_TEMP            0x1a  // Returns F320 temperature
#define nRF_READ_VOLT            0x1b  // Returns RF_VDD voltage
#define nRF_ENTER_TEST_MODE      0x1c  // Ev.board enters production test
#define nRF_READ_RX_DATA         0x1d  // Host read RX data on pipe.n
#define nRF_READ_TX_PLOAD        0x1e  // Host read current RX payload
#define nRF_WR_RX_PLOAD_LENGTH   0x1f  // Host write current RX payload length for pipe.n
#define nRF_RD_RX_PLOAD_LENGTH   0x20  // Host read current RX payload length for pipe.n
#define nRF_WR_FREQ_AGILITY      0x21  // Command to enable/disable frequency agility
#define nRF_RD_FREQ_AGILITY      0x22  // Read previous command's parameter
#define nRF_UPDATE_DEVICE        0x23  // This command is sent before the nRF24L01 are beeing updated
#define nRF_STOP_COMM_MODE       0x24  // This sommand is sent when "Stop Communication Mode" button is pressed
#define nRF_RD_COMM_MODE_STAT    0x25  // Host read current communication mode status (0:TX, 1:RX, 2: IDLE)
#define nRF_RD_LINK_STATUS       0x26  // Host read current link status, i.e. message to host, RX device side

#define nRF_DATA_RATE_1Mbps      0x00  // Dsta rate set to 1Mbps
#define nRF_DATA_RATE_2Mbps      0x08  // Data rate set to 2Mbps

#define nRF_OUTPUT_POWER_m18dBm   0x00  // Output power set to 18dBm
#define nRF_OUTPUT_POWER_m12dBm   0x02
#define nRF_OUTPUT_POWER_m6dBm    0x04
#define nRF_OUTPUT_POWER_0dBm     0x06

#define nRF_AUTO_RETRANSMIT_DELAY_250us       0x00  //Auto retransmit delay wait set to 250us
#define nRF_AUTO_RETRANSMIT_DELAY_500us       0x10  //Auto retransmit delay wait set to 500us
#define nRF_AUTO_RETRANSMIT_DELAY_750us       0x20  //Auto retransmit delay wait set to 750us
#define nRF_AUTO_RETRANSMIT_DELAY_1000us      0x30  //Auto retransmit delay wait set to 1000us
#define nRF_AUTO_RETRANSMIT_DELAY_1250us      0x40  //Auto retransmit delay wait set to 1250us
#define nRF_AUTO_RETRANSMIT_DELAY_1500us      0x50  //Auto retransmit delay wait set to 1500us
#define nRF_AUTO_RETRANSMIT_DELAY_1750us      0x60  //Auto retransmit delay wait set to 1750us
#define nRF_AUTO_RETRANSMIT_DELAY_2000us      0x70  //Auto retransmit delay wait set to 2000us
#define nRF_AUTO_RETRANSMIT_DELAY_2250us      0x80  //Auto retransmit delay wait set to 2250us
#define nRF_AUTO_RETRANSMIT_DELAY_2500us      0x90  //Auto retransmit delay wait set to 2500us
#define nRF_AUTO_RETRANSMIT_DELAY_2750us      0xA0  //Auto retransmit delay wait set to 2750us
#define nRF_AUTO_RETRANSMIT_DELAY_3000us      0xB0  //Auto retransmit delay wait set to 3000us
#define nRF_AUTO_RETRANSMIT_DELAY_3250us      0xC0  //Auto retransmit delay wait set to 3250us
#define nRF_AUTO_RETRANSMIT_DELAY_3500us      0xD0  //Auto retransmit delay wait set to 3500us
#define nRF_AUTO_RETRANSMIT_DELAY_3750us      0xE0  //Auto retransmit delay wait set to 3750us
#define nRF_AUTO_RETRANSMIT_DELAY_4000us      0xF0  //Auto retransmit delay wait set to 4000us

#define nRF_AUTO_RETRANSMIT_COUNT_OFF         0x00  //Auto retransmit disabled
#define nRF_AUTO_RETRANSMIT_COUNT_01          0x01  //Auto retransmit set to 1 time
#define nRF_AUTO_RETRANSMIT_COUNT_02          0x02  //Auto retransmit set to 2 times
#define nRF_AUTO_RETRANSMIT_COUNT_03          0x03  //Auto retransmit set to 3 times
#define nRF_AUTO_RETRANSMIT_COUNT_04          0x04  //Auto retransmit set to 4 times
#define nRF_AUTO_RETRANSMIT_COUNT_05          0x05  //Auto retransmit set to 5 times
#define nRF_AUTO_RETRANSMIT_COUNT_06          0x06  //Auto retransmit set to 6 times
#define nRF_AUTO_RETRANSMIT_COUNT_07          0x07  //Auto retransmit set to 7 times
#define nRF_AUTO_RETRANSMIT_COUNT_08          0x08  //Auto retransmit set to 8 times
#define nRF_AUTO_RETRANSMIT_COUNT_09          0x09  //Auto retransmit set to 9 times
#define nRF_AUTO_RETRANSMIT_COUNT_10          0x0A  //Auto retransmit set to 10 times
#define nRF_AUTO_RETRANSMIT_COUNT_11          0x0B  //Auto retransmit set to 11 times
#define nRF_AUTO_RETRANSMIT_COUNT_12          0x0C  //Auto retransmit set to 12 times
#define nRF_AUTO_RETRANSMIT_COUNT_13          0x0D  //Auto retransmit set to 13 times
#define nRF_AUTO_RETRANSMIT_COUNT_14          0x0E  //Auto retransmit set to 14 times
#define nRF_AUTO_RETRANSMIT_COUNT_15          0x0F  //Auto retransmit set to 15 times

/**************************************************************************************************
* End of File
**************************************************************************************************/