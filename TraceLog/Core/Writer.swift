/**
 *   Writer.swift
 *
 *   Copyright 2016 Tony Stone
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 *
 *   Created by Tony Stone on 4/23/16.
 */
import Swift

///
/// Public protocol for writing log messages to some device or endpoint
///
public protocol Writer {
    
    /**
     * Called when the logger needs to log an event to this logger.
     *
     * @param timestamp             Timestamp of the log event (number of seconds from 1970).
     * @param level                 The LogLevel of this logging event. Note: log will not be called if the LegLevel is not set to above this calls log level
     * @param tag                   The tag associated with the log event.
     * @param message               The message string (already formatted) for this logging event.
     * @param file                  The source file (of the calling program) of this logging event.
     * @param function              The function (of the calling program) which is being called.
     * @param lineNumber            The source line number (of the calling program) of this logging event.
     */
    func log(_ timestamp: Double, level: LogLevel, tag: String, message: String, runtimeContext: RuntimeContext, staticContext: StaticContext)
}

///
/// Runtime context captured at the time of the log statement
///
public protocol RuntimeContext {
    var processName: String { get }
    var processIdentifier: Int { get }
    var threadIdentifier: UInt64 { get }
}

///
/// Static context captured at the time of the log statement
///
public protocol StaticContext {
    var file: String { get }
    var function: String { get }
    var lineNumber: UInt { get }
    var column: UInt { get }
}

