// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v18.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse(
    {Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum PlatformCameraLensDirection {
  /// Front facing camera (a user looking at the screen is seen by the camera).
  front,

  /// Back facing camera (a user looking at the screen is not seen by the camera).
  back,

  /// External camera which may not be mounted to the device.
  external,
}

enum PlatformDeviceOrientation {
  portraitUp,
  landscapeLeft,
  portraitDown,
  landscapeRight,
}

enum PlatformExposureMode {
  auto,
  locked,
}

enum PlatformFocusMode {
  auto,
  locked,
}

class PlatformCameraDescription {
  PlatformCameraDescription({
    required this.name,
    required this.lensDirection,
  });

  /// The name of the camera device.
  String name;

  /// The direction the camera is facing.
  PlatformCameraLensDirection lensDirection;

  Object encode() {
    return <Object?>[
      name,
      lensDirection.index,
    ];
  }

  static PlatformCameraDescription decode(Object result) {
    result as List<Object?>;
    return PlatformCameraDescription(
      name: result[0]! as String,
      lensDirection: PlatformCameraLensDirection.values[result[1]! as int],
    );
  }
}

class PlatformCameraState {
  PlatformCameraState({
    required this.previewSize,
    required this.exposureMode,
    required this.focusMode,
    required this.exposurePointSupported,
    required this.focusPointSupported,
  });

  /// The size of the preview, in pixels.
  PlatformSize previewSize;

  /// The default exposure mode
  PlatformExposureMode exposureMode;

  /// The default focus mode
  PlatformFocusMode focusMode;

  /// Whether setting exposure points is supported.
  bool exposurePointSupported;

  /// Whether setting focus points is supported.
  bool focusPointSupported;

  Object encode() {
    return <Object?>[
      previewSize.encode(),
      exposureMode.index,
      focusMode.index,
      exposurePointSupported,
      focusPointSupported,
    ];
  }

  static PlatformCameraState decode(Object result) {
    result as List<Object?>;
    return PlatformCameraState(
      previewSize: PlatformSize.decode(result[0]! as List<Object?>),
      exposureMode: PlatformExposureMode.values[result[1]! as int],
      focusMode: PlatformFocusMode.values[result[2]! as int],
      exposurePointSupported: result[3]! as bool,
      focusPointSupported: result[4]! as bool,
    );
  }
}

class PlatformSize {
  PlatformSize({
    required this.width,
    required this.height,
  });

  double width;

  double height;

  Object encode() {
    return <Object?>[
      width,
      height,
    ];
  }

  static PlatformSize decode(Object result) {
    result as List<Object?>;
    return PlatformSize(
      width: result[0]! as double,
      height: result[1]! as double,
    );
  }
}

class _CameraApiCodec extends StandardMessageCodec {
  const _CameraApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PlatformCameraDescription) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return PlatformCameraDescription.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class CameraApi {
  /// Constructor for [CameraApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  CameraApi(
      {BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : __pigeon_binaryMessenger = binaryMessenger,
        __pigeon_messageChannelSuffix =
            messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _CameraApiCodec();

  final String __pigeon_messageChannelSuffix;

  /// Returns the list of available cameras.
  Future<List<PlatformCameraDescription?>> getAvailableCameras() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.camera_avfoundation.CameraApi.getAvailableCameras$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as List<Object?>?)!
          .cast<PlatformCameraDescription?>();
    }
  }
}

/// Handler for native callbacks that are not tied to a specific camera ID.
abstract class CameraGlobalEventApi {
  static const MessageCodec<Object?> pigeonChannelCodec =
      StandardMessageCodec();

  /// Called when the device's physical orientation changes.
  void deviceOrientationChanged(PlatformDeviceOrientation orientation);

  static void setUp(
    CameraGlobalEventApi? api, {
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) {
    messageChannelSuffix =
        messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.camera_avfoundation.CameraGlobalEventApi.deviceOrientationChanged$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.camera_avfoundation.CameraGlobalEventApi.deviceOrientationChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PlatformDeviceOrientation? arg_orientation = args[0] == null
              ? null
              : PlatformDeviceOrientation.values[args[0]! as int];
          assert(arg_orientation != null,
              'Argument for dev.flutter.pigeon.camera_avfoundation.CameraGlobalEventApi.deviceOrientationChanged was null, expected non-null PlatformDeviceOrientation.');
          try {
            api.deviceOrientationChanged(arg_orientation!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

class _CameraEventApiCodec extends StandardMessageCodec {
  const _CameraEventApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PlatformCameraState) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is PlatformSize) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return PlatformCameraState.decode(readValue(buffer)!);
      case 129:
        return PlatformSize.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Handler for native callbacks that are tied to a specific camera ID.
///
/// This is intended to be initialized with the camera ID as a suffix.
abstract class CameraEventApi {
  static const MessageCodec<Object?> pigeonChannelCodec =
      _CameraEventApiCodec();

  /// Called when the camera is inialitized for use.
  void initialized(PlatformCameraState initialState);

  /// Called when an error occurs in the camera.
  ///
  /// This should be used for errors that occur outside of the context of
  /// handling a specific HostApi call, such as during streaming.
  void error(String message);

  static void setUp(
    CameraEventApi? api, {
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) {
    messageChannelSuffix =
        messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.camera_avfoundation.CameraEventApi.initialized$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.camera_avfoundation.CameraEventApi.initialized was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PlatformCameraState? arg_initialState =
              (args[0] as PlatformCameraState?);
          assert(arg_initialState != null,
              'Argument for dev.flutter.pigeon.camera_avfoundation.CameraEventApi.initialized was null, expected non-null PlatformCameraState.');
          try {
            api.initialized(arg_initialState!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.camera_avfoundation.CameraEventApi.error$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.camera_avfoundation.CameraEventApi.error was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_message = (args[0] as String?);
          assert(arg_message != null,
              'Argument for dev.flutter.pigeon.camera_avfoundation.CameraEventApi.error was null, expected non-null String.');
          try {
            api.error(arg_message!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
